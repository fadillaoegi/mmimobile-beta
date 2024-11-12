import 'package:mmimobile/modules/app.dart';
import 'package:mmimobile/modules/auth/forgot_password/screens/email_forgot_screen.dart';
import 'package:mmimobile/modules/auth/forgot_password/screens/otp_forgot_screen.dart';
import 'package:mmimobile/modules/auth/forgot_password/screens/reset_password_screen.dart';
import 'package:mmimobile/modules/auth/sign_in/screens/sign_in_screen.dart';
import 'package:mmimobile/modules/auth/sign_up/screens/reveral_code_screen.dart';
import 'package:mmimobile/modules/history/screens/detail_history_screen.dart';
import 'package:mmimobile/modules/history/screens/history_screen.dart';
import 'package:mmimobile/modules/profile/screens/profile_screen.dart';
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
  static const profile = "$root/profile";
  static const coSuccess = "$root/coSuccess";
  static const history = "$root/history";
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
    profile: (context) => const ProfileScreen(),
  };
}
