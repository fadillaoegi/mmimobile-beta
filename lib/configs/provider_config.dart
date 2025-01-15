import 'package:mmimobile/modules/auth/providers/forgot/forgot_pass_provider.dart';
import 'package:mmimobile/modules/auth/providers/forgot/otp_forgot_provider.dart';
import 'package:mmimobile/modules/auth/providers/forgot/reset_password_provider.dart';
import 'package:mmimobile/modules/auth/providers/sign_in_provider.dart';
import 'package:mmimobile/modules/auth/providers/user_provider.dart';
import 'package:mmimobile/modules/faq/providers/faq_provider.dart';
import 'package:mmimobile/modules/home/providers/home_provider.dart';
import 'package:mmimobile/modules/password_edit/providers/password_edit_provider.dart';
import 'package:mmimobile/modules/phone_edit/providers/phone_edit_provider.dart';
import 'package:mmimobile/modules/system_support/providers/system_support_provider.dart';
import 'package:provider/provider.dart';

// class GlobalProviderApps extends ChangeNotifier {
final providers = [
  ChangeNotifierProvider<UserProvider>(
    create: (context) => UserProvider(),
  ),
  ChangeNotifierProvider<SignInProvider>(
    create: (context) => SignInProvider(),
  ),
  ChangeNotifierProvider<ForgotPassProvider>(
    create: (context) => ForgotPassProvider(),
  ),
  ChangeNotifierProvider<OtpForgotProvider>(
    create: (context) => OtpForgotProvider(),
  ),
  ChangeNotifierProvider<ResetPasswordProvider>(
    create: (context) => ResetPasswordProvider(),
  ),
  ChangeNotifierProvider<HomeProvider>(
    create: (context) => HomeProvider(),
  ),
  ChangeNotifierProvider<SystemSupportProvider>(
    create: (context) => SystemSupportProvider(),
  ),
  ChangeNotifierProvider<PasswordEditProvider>(
    create: (context) => PasswordEditProvider(),
  ),
  ChangeNotifierProvider<PhoneEditProvider>(
    create: (context) => PhoneEditProvider(),
  ),
  ChangeNotifierProvider<FaqProvider>(
    create: (context) => FaqProvider(),
  ),
];
// }
