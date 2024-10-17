import 'package:mmimobile/modules/app.dart';
import 'package:mmimobile/modules/auth/forgot_password/screens/email_forgot_screen.dart';
import 'package:mmimobile/modules/auth/forgot_password/screens/otp_forgot_screen.dart';
import 'package:mmimobile/modules/auth/sign_in/screens/sign_in_screen.dart';
import 'package:mmimobile/modules/splash/splash_screen.dart';

class RouteScreen {
  static const root = "/mmimobile";
  static const splash = "$root/splash";
  static const app = "$root/app";
  static const signIn = "$root/signIn";
  static const signUp = "$root/signUp";
  static const forgot = "$root/forgot";
  static const otpForgot = "$root/otpForgot";
  static const browse = "$root/browse";
  static const detail = "$root/detail";
  static const co = "$root/co";
  static const coSuccess = "$root/coSuccess";
  static const history = "$root/history";
  static const underDevelop = "$root/underDevelop";

  static final listRouteScreen = {
    splash: (context) => const SplashScreen(),
    signIn: (context) => const SignInScreen(),
    app: (context) => const AppScreen(),
    forgot: (context) => const EmailForgotScreen(),
    otpForgot: (context) => const OtpForgotScreen(),
    // signUp: (context) => const SignUpScreen(),
    // browse: (context) => const BrowseScreen(),
    // detail: (context) => const DetailScreen(),
    // co: (context) => const CheckoutScreen(),
    // coSuccess: (context) => const CoSuccessScreen(),
    // underDevelop: (context) => const UnderdevelopScreen(),
    // history: (context) => const HistoryScreen(),
  };
}
