import 'dart:developer';
import 'dart:io';

import 'package:dsplatform/components/keyboard/keyboard_overlay.dart';
import 'package:dsplatform/constants/constants.dart';
import 'package:dsplatform/features/authentication/authentication.dart';
import 'package:dsplatform/features/authorization/screens/src/organization_select_page.dart';
import 'package:dsplatform/features/organization/bloc/organization/organization_bloc.dart';
import 'package:dsplatform/features/organization/domain/models/organization/organization_model.dart';
import 'package:dsplatform/features/organization/domain/models/organization_type/organization_type.dart';
import 'package:dsplatform/features/organization/domain/repositories/organization_repository.dart';
import 'package:dsplatform/features/profile/bloc/src/identifier/identifier_bloc.dart';
import 'package:dsplatform/features/profile/domain/models/profile/profile_model.dart';
import 'package:dsplatform/features/profile/domain/models/thesis_status/thesis_status.dart';
import 'package:dsplatform/features/profile/domain/models/user/user_model.dart';
import 'package:dsplatform/features/profile/domain/models/user_type/user_type.dart';
import 'package:dsplatform/features/profile/domain/repositories/user_repository.dart';
import 'package:dsplatform/features/profile/domain/services/user_service.dart';
import 'package:dsplatform/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../profile/bloc/src/user/user_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FinalRegistration extends StatefulWidget {
  const FinalRegistration({Key? key}) : super(key: key);

  @override
  State<FinalRegistration> createState() => _FinalRegistrationState();
}

class _FinalRegistrationState extends State<FinalRegistration> {

  /// Form key
  final _fromKey = GlobalKey<FormState>();

  /// Blocs
  final UserBloc _userBloc = UserBloc(userRepository: IUserRepository());
  final IdentifierBloc _identifierBloc = IdentifierBloc(userRepository: IUserRepository());
  final OrganizationBloc _organizationBloc = OrganizationBloc(
      organizationRepository: IOrganizationRepository());

  /// Form's focus nodes
  bool identifier = true;
  final idFocus = FocusNode();
  final birthDayFocus = FocusNode();
  final numberFocusNode = FocusNode();

  /// Form's controllers
  String? avatarUrl;
  XFile? image;
  DateTime? birthDayDateTime;
  OrganizationModel? organizationModel;
  OrganizationModel hintOrganizationModel = const OrganizationModel(id: -1, bin: "0", nameKk: "Орагнизацияны танданыз", nameRu: "Выберите организацию", nameEn: "Select organization", organizationType: OrganizationType.UNIVERSITY);
  late TextEditingController _idController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _patronymicController;
  late TextEditingController _birthDayController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _emailController;
  var maskFormatter = MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      filter: { "#": RegExp(r'\d') },
      type: MaskAutoCompletionType.lazy
  );
  final ImagePicker _picker = ImagePicker();

  Future _selectImageFromGallery() async {
    image = await _picker.pickImage(source: ImageSource.gallery).whenComplete(() => Navigator.pop(context));
    if(image != null) {
      avatarUrl = await UserService().uploadFile(image!);
    }
    setState(() {});
  }

  Future _selectImageFromCamera() async {
    image = await _picker.pickImage(source: ImageSource.camera).whenComplete(() => Navigator.pop(context));
    if(image != null) {
      avatarUrl = await UserService().uploadFile(image!);
    }
    setState(() {});
  }

  _showAvatarSelector() {
    showCupertinoModalPopup(context: context, builder: (context) {
      return CupertinoActionSheet(
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            child: Text(AppLocalizations.of(context)!.choose_gallery),
            onPressed: () {
              _selectImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: Text(AppLocalizations.of(context)!.take_photo),
            onPressed: () {
              _selectImageFromCamera();
            },
          ),
          CupertinoActionSheetAction(
            child: Text(AppLocalizations.of(context)!.delete_avatar, style: const TextStyle(
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
          child: Text(AppLocalizations.of(context)!.cancel),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );
    });
  }

  Future _loadEmail() async {
    _emailController.text = await const FlutterSecureStorage().read(key: AppSecureStorageKeys.userEmailKey) ?? "";
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    _idController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _patronymicController = TextEditingController();
    _birthDayController = TextEditingController();
    _phoneNumberController = TextEditingController(text: "+7 (___) ___ __ __");
    _emailController = TextEditingController();
    _loadEmail();
    numberFocusNode.addListener(() {
      bool hasFocus = numberFocusNode.hasFocus;
      if (hasFocus) {
        KeyboardOverlay.showOverlay(context);
      } else {
        KeyboardOverlay.removeOverlay();
      }
    });
  }

  @override
  void dispose() {
    _idController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _birthDayController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    numberFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _userBloc,
        ),
        BlocProvider(
          create: (context) => _identifierBloc,
        ),
        BlocProvider(
          create: (context) => _organizationBloc..add(OrganizationLoadEvent()),
        )
      ],
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if(state is UserUpdatedState) {
            GetIt.I.get<AuthenticationBloc>().add(AppStarted());
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.registration),
          ),
          body: ListView(
            reverse: false,
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
                      image == null ? Container(
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            image: DecorationImage(
                                image: FileImage(File(image!.path)),
                                fit: BoxFit.cover
                            )
                        ),
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
                key: _fromKey,
                child: Column(
                  children: [
                    /// Name
                    TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.name
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if(value == null || value == "") {
                          return "Введите имя";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    /// Surname
                    TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.surname
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if(value == null || value == "") {
                          return "Введите фамилию";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    /// Patronymic
                    TextFormField(
                      controller: _patronymicController,
                      decoration: const InputDecoration(
                          labelText: "Отчество"
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if(value == null || value == "") {
                          return "Введите отчество";
                        }
                        return null;
                      },
                      onFieldSubmitted: (v) async {
                        await showDatePicker(
                            context: context,
                            initialDate: birthDayDateTime ?? DateTime.now(),
                            firstDate: DateTime(1890),
                            lastDate: DateTime.now()
                        ).then((value) {
                          if(value != null) {
                            setState(() {
                              birthDayDateTime = value;
                              _birthDayController.text = DateFormat("dd.MM.y").format(value);
                            });
                          }
                        }).whenComplete(() => FocusScope.of(context).requestFocus(idFocus));
                      },
                    ),
                    const SizedBox(height: 16),

                    /// Birth day
                    TextFormField(
                      readOnly: true,
                      focusNode: birthDayFocus,
                      controller: _birthDayController,
                      textInputAction: TextInputAction.next,
                      onTap: () async {
                        await showDatePicker(
                          context: context,
                          initialDate: birthDayDateTime ?? DateTime.now(),
                          firstDate: DateTime(1890),
                          lastDate: DateTime.now()
                        ).then((value) {
                          if(value != null) {
                            setState(() {
                              birthDayDateTime = value;
                              _birthDayController.text = DateFormat("dd.MM.y").format(value);
                            });
                          }
                        }).whenComplete(() => FocusScope.of(context).requestFocus(idFocus));
                      },
                      onFieldSubmitted: (v){
                        FocusScope.of(context).requestFocus(idFocus);
                      },
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.birth_day
                      ),
                      validator: (value) {
                        if(value == null || value == "" || birthDayDateTime == null) {
                          return "Введите дату рождения";
                        }
                        if((DateTime(DateTime.now().year, birthDayDateTime!.month, birthDayDateTime!.day)
                            .isAfter(DateTime.now())
                            ? DateTime.now().year - birthDayDateTime!.year - 1
                            : DateTime.now().year - birthDayDateTime!.year) < 18) {
                          return "Вам должно быть 18 лет или больше";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    /// IIN
                    TextFormField(
                      controller: _idController,
                      focusNode: idFocus,
                      onChanged: (value) {;
                      },
                      validator: (value) {
                        if(value == null || value == "") {
                          return "Введите ИИН";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: "ИИН",
                        prefixStyle: TextStyle(
                          color: Colors.black
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// Phone number
                    TextFormField(
                      controller: _phoneNumberController,
                      inputFormatters: [maskFormatter],
                      focusNode: numberFocusNode,
                      decoration: const InputDecoration(
                        labelText: "Номер телефона",
                      ),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.send,
                      validator: (value) {
                        if(value == null) {
                          return "Введите номер телефона";
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {

                      },
                    ),
                    const SizedBox(height: 16),

                    /// Email
                    TextFormField(
                      enabled: false,
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: "E-Mail",
                      ),
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5)
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// Organization dropdown
                    Container(
                      height: 51,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white
                      ),
                      child: BlocBuilder<OrganizationBloc, OrganizationState>(
                        builder: (context, state) {
                          if(state is OrganizationLoadedState) {
                            return Center(
                              child: DropdownButton<OrganizationModel?>(
                                value: organizationModel,
                                hint: Text(AppLocalizations.of(context)!.select_organization),
                                underline: const Offstage(),
                                items: state.organizations.map((organization) {
                                  return DropdownMenuItem(
                                    value: organization,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width - 88,
                                      child: Text(organization.getNameByLocalization(AppLocalizations.of(context)!.language_code))
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    organizationModel = value;
                                  });
                                }
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// Save
                    Row(
                      children: [
                        Expanded(
                          child: BlocBuilder<UserBloc, UserState>(
                            builder: (context, state) {
                              if(state is UserUpdatingState) {
                                return ElevatedButton(
                                  onPressed: () {},
                                  child: const SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  ),
                                );
                              }
                              return ElevatedButton(
                                onPressed: () async {
                                  bool validation = _fromKey.currentState!.validate();
                                  if(validation){
                                    _userBloc.add(UserDataUpdateEvent(
                                      userModel: UserModel(
                                        id: 1,
                                        email: _emailController.text,
                                        userType: UserType.STUDENT,
                                        phoneNumber: maskFormatter.getUnmaskedText(),
                                        firstName: _firstNameController.text,
                                        surname: _lastNameController.text,
                                        patronymic: _patronymicController.text,
                                        birthDate: _birthDayController.text,
                                        avatar: null, thesisStatus: ThesisStatus.APPROVED,
                                        profile: ProfileModel(
                                          iin: _idController.text,
                                          organization: organizationModel!
                                        ),
                                      )
                                    ));
                                  }
                                },
                                child: const Text(
                                  "Сохранить"
                                ),
                              );
                            },
                          )
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              )
            ],
          ),
        ),
      ),
    );
  }

}
