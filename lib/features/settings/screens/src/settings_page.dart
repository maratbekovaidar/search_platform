import 'package:dsplatform/configurations/configurations.dart';
import 'package:dsplatform/features/authorization/bloc/bloc.dart';
import 'package:dsplatform/features/language/widgets/src/language_picker_widget.dart';
import 'package:dsplatform/features/settings/settings.dart';
import 'package:dsplatform/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
        actions: [
          /// Logout action
          IconButton(
            onPressed: () {
              showCupertinoDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: const Text("Выйти из профиля?"),
                    actions: [
                      CupertinoContextMenuAction(
                          child: const Center(
                            child: Text(
                              "Отмена",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.blue
                              ),
                            ),
                          ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      CupertinoContextMenuAction(
                        onPressed: () {
                          GetIt.I.get<AuthorizationBloc>().add(AuthorizationLogoutButtonPressedEvent());
                          // GoRouter.of(context).pushNamed(AppRouteConstants.loginRoteName);
                        },
                        child: const Center(
                          child: Text(
                            "Да, выйти",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red
                            ),
                          ),
                        )
                      )
                    ],
                  );
                }
              );
            },
            icon: const Icon(
              Icons.exit_to_app_rounded
            )
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(
          top: 16,
          right: 16,
          left: 16,
          bottom: 0
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
        ),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [

            const SizedBox(height: 16),

            /// Title
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.profile,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),

            /// Personal data
            SettingsTileWidget(title: AppLocalizations.of(context)!.personal_data, icon: SvgPicture.asset(Assets.icons.circularProfile), onTap: () {
              GoRouter.of(context).pushNamed(AppRouteConstants.profileInfoRouteName);
            }),

            /// Title
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.general,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),

            /// Пользовательское соглашение
            SettingsTileWidget(title: AppLocalizations.of(context)!.terms_of_use, icon: SvgPicture.asset(Assets.icons.file), onTap: () {
              GoRouter.of(context).pushNamed(AppRouteConstants.termsOfUseRouteName);
            }),

            SettingsTileWidget(title: AppLocalizations.of(context)!.privacy_policy, icon: SvgPicture.asset(Assets.icons.security), onTap: () {
              GoRouter.of(context).pushNamed(AppRouteConstants.privacyPolicyRouteName);
            }),

            SettingsTileWidget(title: AppLocalizations.of(context)!.write_to_support, icon: SvgPicture.asset(Assets.icons.askMessage), onTap: () {
              GoRouter.of(context).pushNamed(AppRouteConstants.supportRouteName);
            }),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  /// Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      /// Icon
                      Icon(
                        Icons.translate_rounded,
                        color: Colors.black,
                        size: 20,
                      ),
                      SizedBox(width: 10),

                      /// Title
                      Text(
                        "Language",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black
                        ),
                      )
                    ],
                  ),

                  /// Language changer
                  const LanguagePickerWidget()
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
