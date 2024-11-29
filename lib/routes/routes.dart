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

class RouteScreen {
  static const root = "/mmimobile";
  static const splash = "$root/splash";
  static const app = "$root/app";
  static const underDevelop = "$root/underDevelop";
  // NOTE: AUTH
  static const signIn = "$root/signIn";
  static const codeReveral = "$root/codeReveral";
  static const signUp = "$root/signUp";
  static const forgot = "$root/forgot";
  static const otpForgot = "$root/otpForgot";
  static const resetPassword = "$root/resetPassword";
  // NOTE: HOME
  static const home = "$root/home";
  // NOTE: HISTORY
  static const history = "$root/history";
  static const detailHistory = "$root/detailHistory";
  static const detailProduct = "$root/detailProduct";
  // NOTE: PROFILE
  static const profile = "$root/profile";
  static const website = "$root/website";
  static const reward = "$root/reward";
  static const privacyPolicy = "$root/privacyPolicy";
  static const faq = "$root/faq";
  static const profileSetting = "$root/profileSetting";
  static const profileEdit = "$root/profileEdit";
  static const editPassword = "$root/editPassword";
  static const phoneEdit = "$root/phoneEdit";
  static const coSuccess = "$root/coSuccess";
  static const historyReward = "$root/historyReward";

  static final listRouteScreen = {
    splash: (context) => const SplashScreen(),
    app: (context) => const AppScreen(),
    // NOTE: AUTH
    signIn: (context) => const SignInScreen(),
    codeReveral: (context) => const ReveralCodeScreen(),
    forgot: (context) => const EmailForgotScreen(),
    otpForgot: (context) => const OtpForgotScreen(),
    resetPassword: (context) => const ResetPasswordScreen(),
    // NOTE: HISTORY
    history: (context) => const HistoryScreen(),
    detailHistory: (context) => const DetailHistoryScreen(),
    detailProduct: (context) => const DetailProductScreen(),
    // NOTE: PROFILE
    profile: (context) => const ProfileScreen(),
    website: (context) => const WebsiteScreen(),
    profileSetting: (context) => const ProfileSettingScreen(),
    profileEdit: (context) => const ProfileEditScreen(),
    editPassword: (context) => const PaswwordEditScreen(),
    phoneEdit: (context) => const PhoneEditScreen(),
    faq: (context) => const FaqScreen(),
    privacyPolicy: (context) => const PrivacyPolicyScreen(),
    reward: (context) => const RewardScreen(),
    historyReward: (context) => const HistoryRewardScreen(),
  };
}
