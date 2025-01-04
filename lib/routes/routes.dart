import 'package:go_router/go_router.dart';
import 'package:mmimobile/modules/app.dart';
import 'package:mmimobile/modules/faq/screens/faq_screen.dart';
import 'package:mmimobile/modules/auth/screens/sign_up_screen.dart';
import 'package:mmimobile/modules/auth/screens/sign_in_screen.dart';
import 'package:mmimobile/modules/website/screens/website_screen.dart';
import 'package:mmimobile/modules/auth/screens/forgot/otp_forgot_screen.dart';
import 'package:mmimobile/modules/auth/screens/forgot/email_forgot_screen.dart';
import 'package:mmimobile/modules/auth/screens/forgot/reset_password_screen.dart';
import 'package:mmimobile/modules/class/screens/class_forum_screen.dart';
import 'package:mmimobile/modules/class/screens/class_free_screen.dart';
import 'package:mmimobile/modules/class/screens/class_premium_screen.dart';
import 'package:mmimobile/modules/auth/screens/reveral_code_screen.dart';
import 'package:mmimobile/modules/history/screens/detail_history_screen.dart';
import 'package:mmimobile/modules/history/screens/detail_product_screen.dart';
import 'package:mmimobile/modules/history/screens/history_screen.dart';
import 'package:mmimobile/modules/home/screens/home_screen.dart';
import 'package:mmimobile/modules/password_edit/screens/paswword_edit_screen.dart';
import 'package:mmimobile/modules/phone_edit/screens/phone_edit_screen.dart';
import 'package:mmimobile/modules/privacy_policy/screens/privacy_policy_screen.dart';
import 'package:mmimobile/modules/profile/screens/profile_screen.dart';
import 'package:mmimobile/modules/profile_edit/screens/profile_edit_screen.dart';
import 'package:mmimobile/modules/profile_setting/screens/profile_setting_screen.dart';
import 'package:mmimobile/modules/reward/screens/history_reward_screen.dart';
import 'package:mmimobile/modules/reward/screens/reward_screen.dart';
import 'package:mmimobile/modules/system_support/screens/system_support_screen.dart';
import 'package:mmimobile/modules/splash/splash_screen.dart';
import 'package:mmimobile/routes/initial_routes.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: RouteScreen.splashPath,
  routes: [
    GoRoute(
      path: RouteScreen.splashPath,
      name: RouteScreen.splash,
      builder: (context, state) => const SplashScreen(),
    ),

    // NOTE: AUTH
    GoRoute(
        path: RouteScreen.signInPath,
        name: RouteScreen.signIn,
        builder: (context, state) => const SignInScreen(),
        routes: [
          // NOTE: MODULE FORGOT PASSWORD
          GoRoute(
              path: RouteScreen.forgotPath,
              name: RouteScreen.forgot,
              builder: (context, state) {
                return const EmailForgotScreen();
              },
              routes: [
                GoRoute(
                    path: RouteScreen.otpForgotPath,
                    name: RouteScreen.otpForgot,
                    builder: (context, state) {
                      final emailUser = state.extra as String;
                      return OtpForgotScreen(
                        emailUser: emailUser,
                      );
                    },
                    routes: [
                      GoRoute(
                        path: RouteScreen.resetPasswordPath,
                        name: RouteScreen.resetPassword,
                        builder: (context, state) =>
                            const ResetPasswordScreen(),
                      ),
                    ]),
              ]),

          // NOTE: MODULE SIGN UP
          GoRoute(
              path: RouteScreen.codeReveralPath,
              name: RouteScreen.codeReveral,
              builder: (context, state) => const ReveralCodeScreen(),
              routes: [
                GoRoute(
                  path: RouteScreen.signUpPath,
                  name: RouteScreen.signUp,
                  builder: (context, state) => const SignUpScreen(),
                ),
              ]),
        ]),

    // NOTE: MODULE MAIN APP SCREEN
    GoRoute(
        path: RouteScreen.appPath,
        name: RouteScreen.app,
        builder: (context, state) {
          return const AppScreen();
        },
        routes: [
          // NOTE: MODULE HOME
          GoRoute(
            path: RouteScreen.homePath,
            name: RouteScreen.home,
            builder: (context, state) => const HomeScreen(),
          ),
          // NOTE: MODULE SYSTEM SUPPORT
          GoRoute(
            path: RouteScreen.systemSupportPath,
            name: RouteScreen.systemSupport,
            builder: (context, state) => const SystemSupportScreen(),
          ),
          GoRoute(
            path: RouteScreen.classFreePath,
            name: RouteScreen.classFree,
            builder: (context, state) => const ClassFreeScreen(),
          ),
          GoRoute(
            path: RouteScreen.classPremiumPath,
            name: RouteScreen.classPremium,
            builder: (context, state) => const ClassPremiumScreen(),
          ),
          GoRoute(
            path: RouteScreen.classForumPath,
            name: RouteScreen.classForum,
            builder: (context, state) => const ClassForumScreen(),
          ),
          // MODULE: MODULE HISTORY
          GoRoute(
            path: RouteScreen.historyPath,
            name: RouteScreen.history,
            builder: (context, state) => const HistoryScreen(),
          ),
          GoRoute(
              path: RouteScreen.detailHistoryPath,
              name: RouteScreen.detailHistory,
              builder: (context, state) => const DetailHistoryScreen(),
              routes: [
                GoRoute(
                  path: RouteScreen.detailProductPath,
                  name: RouteScreen.detailProduct,
                  builder: (context, state) => const DetailProductScreen(),
                ),
              ]),

          // NOTE: MODULE PROFILE
          GoRoute(
            path: RouteScreen.profilePath,
            name: RouteScreen.profile,
            builder: (context, state) => const ProfileScreen(),
          ),
          // NOTE: WEBSITE
          GoRoute(
            path: RouteScreen.websitePath,
            name: RouteScreen.website,
            builder: (context, state) => const WebsiteScreen(),
          ),
          // NOTE: MODULE REWARD
          GoRoute(
              path: RouteScreen.rewardPath,
              name: RouteScreen.reward,
              builder: (context, state) => const RewardScreen(),
              routes: [
                GoRoute(
                  path: RouteScreen.historyRewardPath,
                  name: RouteScreen.historyReward,
                  builder: (context, state) => const HistoryRewardScreen(),
                ),
              ]),
          // NOTE: MODULE PROFILE SETTINGS
          GoRoute(
              path: RouteScreen.profileSettingPath,
              name: RouteScreen.profileSetting,
              builder: (context, state) => const ProfileSettingScreen(),
              routes: [
                GoRoute(
                  path: RouteScreen.profileEditPath,
                  name: RouteScreen.profileEdit,
                  builder: (context, state) => const ProfileEditScreen(),
                ),
                GoRoute(
                  path: RouteScreen.editPasswordPath,
                  name: RouteScreen.editPassword,
                  builder: (context, state) => const PaswwordEditScreen(),
                ),
                GoRoute(
                  path: RouteScreen.phoneEditPath,
                  name: RouteScreen.phoneEdit,
                  builder: (context, state) => const PhoneEditScreen(),
                ),
              ]),
          // NOTE: MODULE FAQ
          GoRoute(
            path: RouteScreen.faqPath,
            name: RouteScreen.faq,
            builder: (context, state) => const FaqScreen(),
          ),
          // NOTE: MODULE PRIVACY POLICY
          GoRoute(
            path: RouteScreen.privacyPolicyPath,
            name: RouteScreen.privacyPolicy,
            builder: (context, state) => const PrivacyPolicyScreen(),
          ),
        ]),
  ],
);

// NOTE: ROUTE DEEFAULT
// final listRouteScreen = {
//   RouteScreen.splash: (context) => const SplashScreen(),
//   RouteScreen.app: (context) => const AppScreen(),
//   // NOTE: AUTH
//   RouteScreen.signIn: (context) => const SignInScreen(),
//   RouteScreen.codeReveral: (context) => const ReveralCodeScreen(),
//   RouteScreen.forgot: (context) => const EmailForgotScreen(),
//   RouteScreen.otpForgot: (context) => const OtpForgotScreen(),
//   RouteScreen.resetPassword: (context) => const ResetPasswordScreen(),
//   // NOTE: HISTORY
//   RouteScreen.history: (context) => const HistoryScreen(),
//   RouteScreen.detailHistory: (context) => const DetailHistoryScreen(),
//   RouteScreen.detailProduct: (context) => const DetailProductScreen(),
//   // NOTE: PROFILE
//   RouteScreen.profile: (context) => const ProfileScreen(),
//   RouteScreen.website: (context) => const WebsiteScreen(),
//   RouteScreen.profileSetting: (context) => const ProfileSettingScreen(),
//   RouteScreen.profileEdit: (context) => const ProfileEditScreen(),
//   RouteScreen.editPassword: (context) => const PaswwordEditScreen(),
//   RouteScreen.phoneEdit: (context) => const PhoneEditScreen(),
//   RouteScreen.faq: (context) => const FaqScreen(),
//   RouteScreen.privacyPolicy: (context) => const PrivacyPolicyScreen(),
//   RouteScreen.reward: (context) => const RewardScreen(),
//   RouteScreen.historyReward: (context) => const HistoryRewardScreen(),
// };
