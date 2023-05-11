import 'package:dsplatform/configurations/configurations.dart';
import 'package:dsplatform/features/profile/bloc/src/friend/friend_bloc.dart';
import 'package:dsplatform/features/profile/domain/models/status_enum/status.dart';
import 'package:dsplatform/features/profile/domain/repositories/friend_repository.dart';
import 'package:dsplatform/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileChatPage extends StatefulWidget {
  const ProfileChatPage({Key? key}) : super(key: key);

  @override
  State<ProfileChatPage> createState() => _ProfileChatPageState();
}

class _ProfileChatPageState extends State<ProfileChatPage> {

  FriendBloc friendBloc = FriendBloc(friendRepository: IFriendRepository());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => friendBloc..add(FriendLoadRequestsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Профиль"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<FriendBloc, FriendState>(
            builder: (context, state) {
              if(state is FriendRequestsLoadedState) {
                return ListView.builder(
                  reverse: true,
                  itemCount: state.loadedRequests.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        /// Data
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: Text(
                                "сегодня",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        /// Message
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 44,
                              width: 44,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              child: state.loadedRequests[index].from.first.avatar == null ? null :
                              Image.network(
                                state.loadedRequests[index].from.first.avatar!
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${state.loadedRequests[index].from.first.firstname} ${state.loadedRequests[index].from.first.lastname.substring(0, 1)}. предлагает подружиться :)",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                      const SizedBox(height: 12),

                                      /// Actions
                                      state.loadedRequests[index].status == Status.PENDING ? Flex(
                                        direction: Axis.horizontal,
                                        children: [

                                          /// Decline
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                friendBloc.add(FriendUpdateRequestEvent(accept: false, objectId: state.loadedRequests[index].objectId));
                                              },
                                              style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(HexColor.fromHex("#F14635", opacity: 0.1))
                                              ),
                                              child: const Text(
                                                "Отказать",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.red
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          /// Accept
                                          Expanded(
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  friendBloc.add(FriendUpdateRequestEvent(accept: true, objectId: state.loadedRequests[index].objectId));
                                                },
                                                child: const Text(
                                                  "Дружить",
                                                  style: TextStyle(
                                                      fontSize: 14
                                                  ),
                                                )
                                            ),
                                          )

                                        ],
                                      ) :
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: HexColor.fromHex("#3C3C43", opacity: 0.36),
                                                  width: 0.5
                                                )
                                              ),
                                              child: state.loadedRequests[index].status == Status.ACCEPTED ? Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    Assets.icons.success,
                                                    width: 20,
                                                    height: 20,
                                                  ),
                                                  const SizedBox(width: 8),
                                                  const Text(
                                                    "Вы подружились",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400
                                                    ),
                                                  )
                                                ],
                                              ) :
                                              Row(
                                                children: const [
                                                  Icon(
                                                    Icons.cancel_outlined,
                                                    color: Colors.red,
                                                  ),
                                                  SizedBox(width: 8),
                                                  Text(
                                                    "Вы отказали",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w400
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      /// Time
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "09:41",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black.withOpacity(0.5)
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                            )
                          ],
                        ),
                        const SizedBox(height: 32)
                      ],
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        )
      ),
    );
  }

}
