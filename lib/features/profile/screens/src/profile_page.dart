import 'package:dsplatform/configurations/configurations.dart';
import 'package:dsplatform/features/profile/bloc/src/friend/friend_bloc.dart';
import 'package:dsplatform/features/profile/bloc/src/user/user_bloc.dart';
import 'package:dsplatform/features/profile/domain/repositories/friend_repository.dart';
import 'package:dsplatform/features/profile/domain/repositories/user_repository.dart';
import 'package:dsplatform/features/profile/screens/src/friend_page.dart';
import 'package:dsplatform/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  UserBloc userBloc = UserBloc(userRepository: IUserRepository());
  FriendBloc friendBloc = FriendBloc(friendRepository: IFriendRepository());
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => userBloc..add(UserLoadEvent()),
        ),
        BlocProvider(
          create: (context) => friendBloc..add(FriendsLoadEvent()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(AppLocalizations.of(context)!.profile),
          actions: [
            IconButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(AppRouteConstants.settingsRouteName);
              },
              icon: const Icon(Icons.settings_outlined)
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: RefreshIndicator(
            onRefresh: () async {
              userBloc.add(UserLoadEvent());
            },
            child: ListView(
              children: [
                const SizedBox(height: 32),

                /// User info
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if(state is UserLoadedState) {
                      return Column(
                        children: [
                          /// Avatar
                          state.userModel.avatar == null ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 96,
                                width: 96,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(24)
                                ),
                                child: SvgPicture.asset(
                                  Assets.icons.profile,
                                  fit: BoxFit.scaleDown,
                                ),
                              )
                            ],
                          ) : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 96,
                                width: 96,
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
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 16),

                          /// Full name
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${state.userModel.firstname} ${state.userModel.lastname.substring(0, 1)}.",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24
                                ),
                              )
                            ],
                          ),

                          /// Id
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "@${state.userModel.identifier}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14
                                ),
                              )
                            ],
                          ),
                        ],
                      );
                    }
                    return Column(
                      children: [
                        /// Avatar
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
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
                            )
                          ],
                        ),
                        const SizedBox(height: 16),

                        /// Full name
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.white.withOpacity(0.2),
                              highlightColor: Colors.white,
                              child: Container(
                                width: 100,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),

                        /// Id
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.white.withOpacity(0.2),
                              highlightColor: Colors.white,
                              child: Container(
                                width: 150,
                                height: 15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 24),

                /// Statistic
                Flex(
                  direction: Axis.horizontal,
                  children: [

                    /// Steps
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Logo
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.icons.activity,
                                  width: 21.32,
                                  height: 26.73,
                                  // ignore: deprecated_member_use
                                  color: HexColor.fromHex('#FF9500'),
                                  theme: SvgTheme(
                                    currentColor: HexColor.fromHex('#FF9500')
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),

                            /// Amount
                            const Text(
                              "0",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),
                            ),
                            const SizedBox(height: 4),

                            /// Subtitle
                            const Text(
                              "Шагов пройдено",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    /// Step verified
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Logo
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    Assets.icons.success,
                                    width: 26.67,
                                    height: 26.67,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),

                              /// Amount
                              const Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black
                                ),
                              ),
                              const SizedBox(height: 4),

                              /// Subtitle
                              const Text(
                                "Шагов засчитано",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 24),

                /// Friends
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [

                      /// Title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          const Text(
                            "Мои друзья",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                            ),
                          ),

                          /// Add friend icon
                          IconButton(
                            icon: SvgPicture.asset(Assets.icons.selectedAddPerson),
                            onPressed: () {
                              GoRouter.of(context).pushNamed(AppRouteConstants.addFriendRouteName);
                            },
                          ),

                        ],
                      ),
                      const SizedBox(height: 16),

                      BlocBuilder<FriendBloc, FriendState>(
                        builder: (context, state) {
                          if(state is FriendLoadedState) {
                            if(state.friends.isEmpty) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "У вас пока нет друзей",
                                    style: TextStyle(
                                        color: HexColor.fromHex("#000000", opacity: 0.5),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14
                                    ),
                                  )
                                ],
                              );
                            }
                            return Column(
                              children: state.friends.map((friend) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => FriendPage(userModel: friend)));
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 44,
                                                height: 44,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                                child: Image.network(friend.avatar!),
                                              ),
                                              const SizedBox(width: 16),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${friend.firstname} ${friend.lastname.substring(0, 1)}.",
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w500
                                                    ),
                                                  ),
                                                  Text(
                                                    "@${friend.identifier}",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        color: Colors.black.withOpacity(0.5),
                                                        fontSize: 10
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),

                                          const Text(
                                            "0 шагов",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const Divider(),
                                    const SizedBox(height: 16),
                                  ],
                                );
                              }).toList(),
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 24),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
