import 'package:mmimobile/modules/app.dart';
import 'package:mmimobile/modules/auth/forgot_password/screens/email_forgot_screen.dart';
import 'package:mmimobile/modules/auth/forgot_password/screens/otp_forgot_screen.dart';
import 'package:mmimobile/modules/auth/forgot_password/screens/reset_password_screen.dart';
import 'package:mmimobile/modules/auth/sign_in/screens/sign_in_screen.dart';
import 'package:mmimobile/modules/auth/sign_up/screens/reveral_code_screen.dart';
import 'package:mmimobile/modules/faq/screens/faq_screen.dart';
import 'package:mmimobile/modules/history/screens/detail_history_screen.dart';
import 'package:mmimobile/modules/history/screens/detail_product_screen.dart';
import 'package:mmimobile/modules/history/screens/history_screen.dart';
import 'package:mmimobile/modules/password_edit/screens/paswword_edit_screen.dart';
import 'package:mmimobile/modules/privacy_policy/screens/privacy_policy_screen.dart';
import 'package:mmimobile/modules/profile/screens/profile_screen.dart';
import 'package:mmimobile/modules/profile_edit/screens/profile_edit_screen.dart';
import 'package:mmimobile/modules/profile_setting/screens/profile_setting_screen.dart';
import 'package:mmimobile/modules/reward/screens/history_reward_screen.dart';
import 'package:mmimobile/modules/reward/screens/reward_screen.dart';
import 'package:mmimobile/modules/splash/splash_screen.dart';

class RouteScreen {
  static const root = "/mmimobile";
  static const splash = "$root/splash";
  static const app = "$root/app";
  static const signIn = "$root/signIn";
  static const codeReveral = "$root/codeReveral";
  static const signUp = "$root/signUp";
  static const forgot = "$root/forgot";
  static const otpForgot = "$root/otpForgot";
  static const resetPassword = "$root/resetPassword";
  static const browse = "$root/browse";
  static const detailHistory = "$root/detailHistory";
  static const detailProduct = "$root/detailProduct";
  static const profile = "$root/profile";
  static const profileSetting = "$root/profileSetting";
  static const profileEdit = "$root/profileEdit";
  static const editPassword = "$root/editPassword";
  static const coSuccess = "$root/coSuccess";
  static const history = "$root/history";
  static const privacyPolicy = "$root/privacyPolicy";
  static const faq = "$root/faq";
  static const reward = "$root/reward";
  static const historyReward = "$root/historyReward";
  static const underDevelop = "$root/underDevelop";

  static final listRouteScreen = {
    splash: (context) => const SplashScreen(),
    signIn: (context) => const SignInScreen(),
    codeReveral: (context) => const ReveralCodeScreen(),
    app: (context) => const AppScreen(),
    forgot: (context) => const EmailForgotScreen(),
    otpForgot: (context) => const OtpForgotScreen(),
    resetPassword: (context) => const ResetPasswordScreen(),
    history: (context) => const HistoryScreen(),
    detailHistory: (context) => const DetailHistoryScreen(),
    detailProduct: (context) => const DetailProductScreen(),
    profile: (context) => const ProfileScreen(),
    profileSetting: (context) => const ProfileSettingScreen(),
    profileEdit: (context) => const ProfileEditScreen(),
    editPassword: (context) => const PaswwordEditScreen(),
    faq: (context) => const FaqScreen(),
    privacyPolicy: (context) => const PrivacyPolicyScreen(),
    reward: (context) => const RewardScreen(),
    historyReward: (context) => const HistoryRewardScreen(),
  };
}
