import 'package:dsplatform/components/notification_widget/notification_widget.dart';
import 'package:dsplatform/features/profile/bloc/src/friend/friend_bloc.dart';
import 'package:dsplatform/features/profile/domain/repositories/friend_repository.dart';
import 'package:dsplatform/features/profile/screens/src/add_friend_success_page.dart';
import 'package:dsplatform/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class AddFriendPage extends StatefulWidget {
  const AddFriendPage({Key? key}) : super(key: key);

  @override
  State<AddFriendPage> createState() => _AddFriendPageState();
}

class _AddFriendPageState extends State<AddFriendPage> {

  final FriendBloc _friendBloc = FriendBloc(
      friendRepository: IFriendRepository());
  late TextEditingController _searchController;
  final _formKey = GlobalKey<FormState>();
  bool identifier = false;
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _friendBloc,
      child: BlocListener<FriendBloc, FriendState>(
        listener: (context, state) {
          if(state is FriendRequestSuccessState) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddFriendSuccessPage(fullName: "Example")));
          }
          if(state is FriendFailureState) {
            showNotificationWidget(
              context,
              "Не получилось, повторите позже...",
              NotificationWidgetType.error,
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
              title: const Text(
                  "Добавить друга"
              ),
            ),
          body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),

                  /// Logo
                  BlocBuilder<FriendBloc, FriendState>(
                    builder: (context, state) {
                      if(state is FriendLoadedState) {
                        if(state.friends.isNotEmpty) {
                          return Column(
                            children: [
                              /// Searched friend's avatar
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 96,
                                      width: 96,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(24)
                                      ),
                                      child: ClipRRect(
                                        child: CachedNetworkImage(
                                          imageUrl: state.friends.first.avatar!,
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
                                ],
                              ),
                              const SizedBox(height: 16),

                              /// His name
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${state.friends.first.firstname} ${state.friends.first.lastname.substring(0, 1)}.",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                      color: Colors.black
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              )
                            ],
                          );
                        }
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 96,
                                  width: 96,
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(24)
                                  ),
                                  child: SvgPicture.asset(
                                    Assets.icons.selectedAddPerson,
                                    // ignore: deprecated_member_use
                                    color: Colors.black.withOpacity(0.2),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 45)
                          ],
                        );
                      }
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 96,
                                width: 96,
                                padding: const EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(24)
                                ),
                                child: SvgPicture.asset(
                                  Assets.icons.selectedAddPerson,
                                  // ignore: deprecated_member_use
                                  color: Colors.black.withOpacity(0.2),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 45)
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 24),

                  /// Search
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _searchController,
                          onChanged: (value) {
                            _friendBloc.add(FriendsSearchEvent(identifier: value));
                          },
                          validator: (value) {
                            if (value == "") {
                              return "Введите идентификатор друга";
                            }
                            if (!identifier) {
                              return "Такого профиля не существует";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: const Text("Идентификатор друга"),
                            prefixText: "@",
                            prefixStyle: const TextStyle(color: Colors.black),
                            suffix: BlocBuilder<FriendBloc, FriendState>(
                              builder: (context, state) {
                                if(state is FriendLoadingState) {
                                  return const SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: CircularProgressIndicator(
                                      color: Colors.blue,
                                      strokeWidth: 2,
                                    ),
                                  );
                                }
                                if(state is FriendLoadedState) {
                                  if(state.friends.isNotEmpty) {
                                    identifier = true;
                                    return Container(
                                        padding: EdgeInsets.zero,
                                        height: 16,
                                        width: 16,
                                        child: SvgPicture.asset(Assets.icons.success)
                                    );
                                  } else {
                                    identifier = false;
                                    return const Offstage();
                                  }
                                }
                                return const Offstage();
                              },
                            )
                          ),
                        ),
                        const SizedBox(height: 16),

                        /// Confirm button
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _friendBloc.add(FriendAddRequestEvent(id: _searchController.text));
                                    }
                                  },
                                  child: const Text("Отправить запрос")
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )

                ],
              ),
          )
        ),
      ),
    );
  }
}
