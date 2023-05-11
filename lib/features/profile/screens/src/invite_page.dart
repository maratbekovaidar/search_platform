import 'package:dsplatform/components/notification_widget/notification_widget.dart';
import 'package:dsplatform/constants/constants.dart';
import 'package:dsplatform/features/profile/bloc/src/invite/invite_bloc.dart';
import 'package:dsplatform/features/profile/domain/models/status_enum/status.dart';
import 'package:dsplatform/features/profile/domain/repositories/invite_repository.dart';
import 'package:dsplatform/features/profile/screens/src/invite_success_page.dart';
import 'package:dsplatform/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InvitePage extends StatefulWidget {
  const InvitePage({Key? key}) : super(key: key);

  @override
  State<InvitePage> createState() => _InvitePageState();
}

class _InvitePageState extends State<InvitePage> with TickerProviderStateMixin {

  final formKey = GlobalKey<FormState>();
  late TabController _tabController;
  late TextEditingController _inviteEmailController;
  InviteBloc inviteBloc = InviteBloc(inviteRepository: IInviteRepository());

  int remainingInvites = 0;

  Future _getRemainingInvites() async {
    String? remainingInvitesString = await const FlutterSecureStorage().read(key: AppSecureStorageKeys.remainingInvitesKey);
    if(remainingInvitesString != null) {
      setState(() {
        remainingInvites = int.parse(remainingInvitesString);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _inviteEmailController = TextEditingController();
    _tabController = TabController(length: 2, vsync: this);
    _getRemainingInvites();
  }

  @override
  void dispose() {
    _inviteEmailController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inviteBloc..add(InviteLoadEvent()),
      child: BlocListener<InviteBloc, InviteState>(
        listener: (context, state) {
          if(state is InviteSuccessState) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => InviteSuccessPage(email: _inviteEmailController.text,)));
            inviteBloc.add(InviteLoadEvent());
          }
          if(state is InviteFailureState) {
            showErrorNotificationWidget(context);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Пригласить друга"),
          ),
          body: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(height: 32),
                  /// Logo
                  Container(
                    width: 96,
                    height: 96,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)
                    ),
                    child: SvgPicture.asset(
                      Assets.icons.sendMail,

                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),

              /// Tab bar
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(6)
                ),
                height: 30,
                child: TabBar(
                  padding: const EdgeInsets.all(2),
                  controller: _tabController,
                  tabs: const [
                    Tab(
                      text: "Пригласить",
                    ),
                    Tab(
                      text: "Отправленные",
                    )
                  ]
                ),
              ),

              /// Content of tabs
              SizedBox(
                height: MediaQuery.of(context).size.height - 246,
                child: TabBarView(
                  controller: _tabController,
                  children: [

                    /// Sending invite
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [

                            /// Invited Email
                            TextFormField(
                              controller: _inviteEmailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Введите E-Mail';
                                }
                                if(!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                    .hasMatch(value)) {
                                  return 'Введите корректный E-Mail';
                                }
                                if(remainingInvites == 0) {
                                  return "У вас нет приглашений";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: "E-Mail"
                              ),
                            ),
                            const SizedBox(height: 16),
                            BlocBuilder<InviteBloc, InviteState>(
                              builder: (context, state) {
                                if(state is InviteLoadingState) {
                                  return Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                          },
                                          child: const SizedBox(
                                            height: 16,
                                            width: 16,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 2,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }
                                return Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                          onPressed: () {
                                            if(formKey.currentState!.validate()) {
                                              BlocProvider.of<InviteBloc>(context).add(InviteByEmailEvent(email: _inviteEmailController.text));
                                            }
                                          },
                                          child: const Text(
                                              "Отправить"
                                          )
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Осталось $remainingInvites из 5 приглашений",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                      color: Colors.black.withOpacity(0.5)
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                    /// Sent invite
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: BlocBuilder<InviteBloc, InviteState>(
                        builder: (context, state) {
                          if(state is InviteLoadingState) {
                            /// TODO: rework to shimmer effect
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if(state is InviteLoadedState) {
                            return Column(
                              children: state.invites.map((invite) {
                                return Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 51,
                                        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12)
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                /// Email
                                                Text(
                                                  invite.email,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
                                                    color: Colors.black
                                                  ),
                                                ),
                                                invite.status == Status.PENDING ? Text(
                                                  "Пользователь еще не зарегистрировался",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10,
                                                    color: Colors.black.withOpacity(0.5)
                                                  ),
                                                ) : Container()
                                              ],
                                            ),

                                            invite.status == Status.ACCEPTED ? SvgPicture.asset(
                                              Assets.icons.success,
                                              height: 20,
                                              width: 20,
                                            ) : GestureDetector(
                                              onTap: () async {
                                                showCupertinoDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return CupertinoAlertDialog(
                                                      title: const Text(
                                                        "Отозвать приглашение?",
                                                        style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight: FontWeight.w600
                                                        ),
                                                      ),
                                                      content: Text(
                                                        "Пользователь не сможет зарегистрироваться в приложении по вашему приглашению",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 13,
                                                          color: Colors.black.withOpacity(0.5)
                                                        ),
                                                      ),
                                                      actions: [

                                                        /// Cancel
                                                        CupertinoActionSheetAction(
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          child: Text(
                                                            "Отмена",
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 17,
                                                              color: Theme.of(context).primaryColor
                                                            ),
                                                          )
                                                        ),

                                                        /// Yes
                                                        CupertinoActionSheetAction(
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                            inviteBloc.add(InviteRevokeEvent(email: invite.email));
                                                          },
                                                          child: const Text(
                                                            "Да, отозвать",
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 17,
                                                              color: Colors.red
                                                            ),
                                                          )
                                                        ),

                                                      ],
                                                    );
                                                  }
                                                );
                                              },
                                              child: SvgPicture.asset(
                                                Assets.icons.remove,
                                                height: 14,
                                                width: 14,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            );
                          }
                          return Container();
                        },
                      ),
                    ),

                  ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
