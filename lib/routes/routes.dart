import 'package:mmimobile/modules/app.dart';
import 'package:mmimobile/modules/auth/screens/forgot/email_forgot_screen.dart';
import 'package:mmimobile/modules/auth/screens/forgot/otp_forgot_screen.dart';
import 'package:mmimobile/modules/auth/screens/forgot/reset_password_screen.dart';
import 'package:mmimobile/modules/auth/screens/sign_in_screen.dart';
import 'package:mmimobile/modules/auth/screens/reveral_code_screen.dart';
import 'package:mmimobile/modules/faq/screens/faq_screen.dart';
import 'package:mmimobile/modules/history/screens/detail_history_screen.dart';
import 'package:mmimobile/modules/history/screens/detail_product_screen.dart';
import 'package:mmimobile/modules/history/screens/history_screen.dart';
import 'package:mmimobile/modules/password_edit/screens/paswword_edit_screen.dart';
import 'package:mmimobile/modules/phone_edit/screens/phone_edit_screen.dart';
import 'package:mmimobile/modules/privacy_policy/screens/privacy_policy_screen.dart';
import 'package:mmimobile/modules/profile/screens/profile_screen.dart';
import 'package:mmimobile/modules/profile_edit/screens/profile_edit_screen.dart';
import 'package:mmimobile/modules/profile_setting/screens/profile_setting_screen.dart';
import 'package:mmimobile/modules/reward/screens/history_reward_screen.dart';
import 'package:mmimobile/modules/reward/screens/reward_screen.dart';
import 'package:mmimobile/modules/splash/splash_screen.dart';
import 'package:mmimobile/modules/website/screens/website_screen.dart';
import 'package:mmimobile/routes/initial_routes.dart';

final listRouteScreen = {
  RouteScreen.splash: (context) => const SplashScreen(),
  RouteScreen.app: (context) => const AppScreen(),
  // NOTE: AUTH
  RouteScreen.signIn: (context) => const SignInScreen(),
  RouteScreen.codeReveral: (context) => const ReveralCodeScreen(),
  RouteScreen.forgot: (context) => const EmailForgotScreen(),
  RouteScreen.otpForgot: (context) => const OtpForgotScreen(),
  RouteScreen.resetPassword: (context) => const ResetPasswordScreen(),
  // NOTE: HISTORY
  RouteScreen.history: (context) => const HistoryScreen(),
  RouteScreen.detailHistory: (context) => const DetailHistoryScreen(),
  RouteScreen.detailProduct: (context) => const DetailProductScreen(),
  // NOTE: PROFILE
  RouteScreen.profile: (context) => const ProfileScreen(),
  RouteScreen.website: (context) => const WebsiteScreen(),
  RouteScreen.profileSetting: (context) => const ProfileSettingScreen(),
  RouteScreen.profileEdit: (context) => const ProfileEditScreen(),
  RouteScreen.editPassword: (context) => const PaswwordEditScreen(),
  RouteScreen.phoneEdit: (context) => const PhoneEditScreen(),
  RouteScreen.faq: (context) => const FaqScreen(),
  RouteScreen.privacyPolicy: (context) => const PrivacyPolicyScreen(),
  RouteScreen.reward: (context) => const RewardScreen(),
  RouteScreen.historyReward: (context) => const HistoryRewardScreen(),
};
