import 'package:dsplatform/configurations/configurations.dart';
import 'package:dsplatform/features/profile/bloc/src/user/user_bloc.dart';
import 'package:dsplatform/features/profile/domain/repositories/user_repository.dart';
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
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => userBloc..add(UserLoadEvent()),
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
                                "${state.userModel.firstName} ${state.userModel.surname.substring(0, 1)}.",
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
                                "@${state.userModel.email}",
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

              ],
            ),
          ),
        ),
      ),
    );
  }
}
