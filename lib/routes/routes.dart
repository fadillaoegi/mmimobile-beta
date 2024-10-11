import 'package:mmimobile/modules/auth/sign_in/screens/sign_in_screen.dart';
import 'package:mmimobile/modules/splash/splash_screen.dart';

class RouteScreen {
  static const root = "/mmimobile";
  static const splash = "$root/splash";
  static const signIn = "$root/signIn";
  static const signUp = "$root/signUp";
  static const browse = "$root/browse";
  static const detail = "$root/detail";
  static const co = "$root/co";
  static const coSuccess = "$root/coSuccess";
  static const history = "$root/history";
  static const underDevelop = "$root/underDevelop";

  static final listRouteScreen = {
    splash: (context) => const SplashScreen(),
    signIn: (context) => const SignInScreen(),
    // signUp: (context) => const SignUpScreen(),
    // browse: (context) => const BrowseScreen(),
    // detail: (context) => const DetailScreen(),
    // co: (context) => const CheckoutScreen(),
    // coSuccess: (context) => const CoSuccessScreen(),
    // underDevelop: (context) => const UnderdevelopScreen(),
    // history: (context) => const HistoryScreen(),
  };
}
