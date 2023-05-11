import 'package:dsplatform/configurations/router/router.dart';
import 'package:dsplatform/features/authentication/authentication.dart';
import 'package:dsplatform/features/authorization/authorization.dart';
import 'package:dsplatform/features/home/home.dart';
import 'package:dsplatform/features/profile/profile.dart';
import 'package:dsplatform/features/settings/settings.dart';
import 'package:flutter/material.dart';

class AppRouter {

  static GoRouter returnRouter(bool isAuth) {

    if(isAuth) {
      return GoRouter(
        initialLocation: "/",
        routes: [

          /// Home
          GoRoute(
            name: AppRouteConstants.homeRouteName,
            path: '/',
            pageBuilder: (context, state) {
              return const MaterialPage(child: HomePage());
            },
          ),
          /// Landing
          GoRoute(
            name: AppRouteConstants.landingRouteName,
            path: '/landing',
            pageBuilder: (context, state) {
              return const MaterialPage(child: LandingPage());
            },
          ),
          /// Settings routing part
          /// Set pin code
          GoRoute(
            name: AppRouteConstants.setPinCodeRoteName,
            path: '/set_pin_code',
            pageBuilder: (context, state) {
              return const MaterialPage(child: SetPinCodePage());
            },
          ),
          /// Settings
          GoRoute(
            name: AppRouteConstants.settingsRouteName,
            path: '/settings',
            pageBuilder: (context, state) {
              return const MaterialPage(child: SettingsPage());
            },
          ),
          /// Support
          GoRoute(
            name: AppRouteConstants.supportRouteName,
            path: '/support',
            pageBuilder: (context, state) {
              return const MaterialPage(child: SupportPage());
            },
          ),
          /// Terms of use
          GoRoute(
            name: AppRouteConstants.termsOfUseRouteName,
            path: '/terms_of_use',
            pageBuilder: (context, state) {
              return const MaterialPage(child: TermsOfUse());
            },
          ),
          /// Privacy policy
          GoRoute(
            name: AppRouteConstants.privacyPolicyRouteName,
            path: '/privacy_policy',
            pageBuilder: (context, state) {
              return const MaterialPage(child: PrivacyPolicyPage());
            },
          ),

          /// Profile routing part
          /// Profile info page
          GoRoute(
            name: AppRouteConstants.profileInfoRouteName,
            path: '/profile_info',
            pageBuilder: (context, state) {
              return const MaterialPage(child: ProfileInfoPage());
            },
          ),
          /// Add friend page
          GoRoute(
            name: AppRouteConstants.addFriendRouteName,
            path: '/add_friend',
            pageBuilder: (context, state) {
              return const MaterialPage(child: AddFriendPage());
            },
          ),
          /// Invite page
          GoRoute(
            name: AppRouteConstants.inviteRouteName,
            path: '/invite',
            pageBuilder: (context, state) {
              return const MaterialPage(child: InvitePage());
            },
          ),
          /// Promo code
          GoRoute(
            name: AppRouteConstants.promoCodeRouteName,
            path: '/promo_code',
            pageBuilder: (context, state) {
              return const MaterialPage(child: PromoCodePage());
            },
          ),

        ],
        errorPageBuilder: (context, state) {
          return const MaterialPage(child: ErrorPage(errorText: "Forbidden"));
        },
      );
    } else {
      return GoRouter(
        initialLocation: "/login",
        routes: [
          /// Authorization routing part
          /// Login
          GoRoute(
            name: AppRouteConstants.loginRoteName,
            path: '/login',
            pageBuilder: (context, state) {
              return const MaterialPage(child: LoginPage());
            },
          ),
          /// Registration
          GoRoute(
            name: AppRouteConstants.registrationRoteName,
            path: '/registration',
            pageBuilder: (context, state) {
              return const MaterialPage(child: RegistrationPage());
            },
          ),
          /// Registration set password
          GoRoute(
            name: AppRouteConstants.registrationSetPasswordRoteName,
            path: '/registration_set_password/:email',
            pageBuilder: (context, state) {
              return MaterialPage(child: RegistrationSetPasswordPage(email: state.params['email'] ?? "null",));
            },
          ),
          /// Password recovery
          GoRoute(
            name: AppRouteConstants.passwordRecoveryRoteName,
            path: '/password_recovery',
            pageBuilder: (context, state) {
              return const MaterialPage(child: PasswordRecoveryPage());
            },
          ),
          /// Password recovery confirm
          GoRoute(
            name: AppRouteConstants.passwordRecoveryConfirmRoteName,
            path: '/password_recovery_confirm',
            pageBuilder: (context, state) {
              return const MaterialPage(child: PasswordRecoveryConfirmPage());
            },
          ),
          /// Terms of use
          GoRoute(
            name: AppRouteConstants.termsOfUseRouteName,
            path: '/terms_of_use',
            pageBuilder: (context, state) {
              return const MaterialPage(child: TermsOfUse());
            },
          ),
          /// Privacy policy
          GoRoute(
            name: AppRouteConstants.privacyPolicyRouteName,
            path: '/privacy_policy',
            pageBuilder: (context, state) {
              return const MaterialPage(child: PrivacyPolicyPage());
            },
          ),

        ],
        errorPageBuilder: (context, state) {
          return const MaterialPage(child: ErrorPage(errorText: "Forbidden"));
        },
      );
    }
  }

}