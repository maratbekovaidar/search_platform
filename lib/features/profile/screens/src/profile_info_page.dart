import 'package:dsplatform/features/profile/bloc/src/avatar/avatar_bloc.dart';
import 'package:dsplatform/features/profile/bloc/src/identifier/identifier_bloc.dart';
import 'package:dsplatform/features/profile/bloc/src/user/user_bloc.dart';
import 'package:dsplatform/features/profile/domain/models/user/user_model.dart';
import 'package:dsplatform/features/profile/domain/repositories/user_repository.dart';
import 'package:dsplatform/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({Key? key}) : super(key: key);

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {

  final _formKey = GlobalKey<FormState>();
  bool editId = false;
  late TextEditingController idController;
  bool identifier = true;
  XFile? image;
  UserBloc userBloc = UserBloc(userRepository: IUserRepository());
  IdentifierBloc identifierBloc = IdentifierBloc(userRepository: IUserRepository());
  AvatarBloc avatarBloc = AvatarBloc(userRepository: IUserRepository());
  final ImagePicker _picker = ImagePicker();
  late UserModel userModel;

  Future selectImageFromGallery() async {
    image = await _picker.pickImage(source: ImageSource.gallery).whenComplete(() => Navigator.pop(context));
    if(image != null) {
      avatarBloc.add(UserAvatarUploadEvent(avatar: image!));
    }
  }

  Future selectImageFromCamera() async {
    image = await _picker.pickImage(source: ImageSource.camera).whenComplete(() => Navigator.pop(context));
    if(image != null) {
      avatarBloc.add(UserAvatarUploadEvent(avatar: image!));
    }
  }

  _showAvatarSelector() {
    showCupertinoModalPopup(context: context, builder: (context) {
      return CupertinoActionSheet(
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            child: const Text('Выбрать из галереи'),
            onPressed: () {
              selectImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Сделать снимок'),
            onPressed: () {
              selectImageFromCamera();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Удалить аватар', style: TextStyle(
                color: Colors.red
            ),),
            onPressed: () {
              setState(() {
                image = null;
              });
              Navigator.pop(context);
            },
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text('Отмена'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
  }

  @override
  void dispose() {
    idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => userBloc..add(UserLoadEvent()),
        ),
        BlocProvider(
          create: (context) => identifierBloc,
        ),
        BlocProvider(
          create: (context) => avatarBloc,
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<UserBloc, UserState>(
              listener: (context, state) {
                if(state is UserUpdatedState) {
                  userBloc.add(UserLoadEvent());
                }
              },
      ),
          BlocListener<AvatarBloc, AvatarState>(
            listener: (context, state) {
              if(state is UserAvatarUploadedState) {
                userBloc.add(UserDataUpdateEvent(userModel: userModel.copyWith(
                  avatar: state.avatarUrl
                )));
              }
            },
          ),
        ],
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text("Персональные данные"),
          ),
          body: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if(state is UserLoadedState) {
                userModel = state.userModel;
                return ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  children: [

                    const SizedBox(height: 16),
                    /// Avatar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [

                            /// Avatar
                            state.userModel.avatar == null ? Container(
                              height: 96,
                              width: 96,
                              margin: const EdgeInsets.only(
                                right: 8,
                                bottom: 8
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Colors.white
                              ),
                              child: SvgPicture.asset(
                                Assets.icons.profile,
                                fit: BoxFit.scaleDown,
                              ),
                            ) : Container(
                              height: 96,
                              width: 96,
                              margin: const EdgeInsets.only(
                                right: 8,
                                bottom: 8
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: CachedNetworkImage(
                                  imageUrl: state.userModel.avatar!,
                                  placeholder: (context, url) {
                                    return Shimmer.fromColors(
                                      baseColor: Colors.white.withOpacity(0.2),
                                      highlightColor: Colors.white,
                                      child: Container(
                                        height: 96,
                                        width: 96,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(24)
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ),

                            /// Edit icon
                            Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: () async {
                                  if (await Permission.camera.request().isGranted && await Permission.photos.request().isGranted) {
                                    _showAvatarSelector();
                                  }
                                },
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.blue
                                  ),
                                  child: const Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 24),

                    /// Form
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          /// Name
                          TextField(
                            readOnly: true,
                            enabled: false,
                            controller: TextEditingController(text: state.userModel.firstName),
                            decoration: const InputDecoration(
                              labelText: "Имя"
                            ),
                          ),
                          const SizedBox(height: 16),

                          /// Surname
                          TextField(
                            readOnly: true,
                            enabled: false,
                            controller: TextEditingController(text: state.userModel.surname),
                            decoration: const InputDecoration(
                              labelText: "Фамилия"
                            ),
                          ),
                          const SizedBox(height: 16),

                          /// Patronymic
                          TextField(
                            readOnly: true,
                            enabled: false,
                            controller: TextEditingController(text: state.userModel.patronymic),
                            decoration: const InputDecoration(
                              labelText: "Отчество"
                            ),
                          ),
                          const SizedBox(height: 16),

                          /// Birth day
                          TextField(
                            readOnly: true,
                            enabled: false,
                            controller: TextEditingController(text: DateFormat("dd.MM.y").format(DateTime.tryParse(state.userModel.birthDate) ?? DateTime.now())),
                            decoration: const InputDecoration(
                              labelText: "Дата рождение"
                            ),
                          ),
                          const SizedBox(height: 16),

                          /// Phone number
                          TextField(
                            readOnly: true,
                            enabled: false,
                            controller: TextEditingController(text: state.userModel.phoneNumber),
                            decoration: const InputDecoration(
                              labelText: "Номер телефона"
                            ),
                          ),
                          const SizedBox(height: 16),

                          /// Email
                          TextField(
                            readOnly: true,
                            enabled: false,
                            controller: TextEditingController(text: state.userModel.email),
                            decoration: const InputDecoration(
                                labelText: "E-Mail"
                            ),
                          ),
                          const SizedBox(height: 16),

                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    )
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
