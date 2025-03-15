import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/account_security/bindings/account_security_binding.dart';
import '../modules/account_security/views/account_security_view.dart';
import '../modules/app_main/bindings/app_main_binding.dart';
import '../modules/app_main/views/app_main_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/modules_system_support/list_support/bindings/list_support_binding.dart';
import '../modules/modules_system_support/list_support/views/list_support_view.dart';
import '../modules/modules_auth/add_email/bindings/add_email_binding.dart';
import '../modules/modules_auth/add_email/views/add_email_view.dart';
import '../modules/modules_auth/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/modules_auth/forgot_password/views/forgot_password_view.dart';
import '../modules/modules_auth/otp/bindings/otp_binding.dart';
import '../modules/modules_auth/otp/views/otp_view.dart';
import '../modules/modules_auth/reset_password/bindings/reset_password_binding.dart';
import '../modules/modules_auth/reset_password/views/reset_password_view.dart';
import '../modules/modules_auth/sign_in/bindings/sign_in_binding.dart';
import '../modules/modules_auth/sign_in/views/sign_in_view.dart';
import '../modules/modules_auth/sign_up/bindings/sign_up_binding.dart';
import '../modules/modules_auth/sign_up/views/sign_up_view.dart';
import '../modules/modules_history/history/bindings/history_binding.dart';
import '../modules/modules_history/history/views/history_view.dart';
import '../modules/modules_history/history_detail/bindings/history_detail_binding.dart';
import '../modules/modules_history/history_detail/views/history_detail_view.dart';
import '../modules/modules_profile/account_setting/bindings/account_setting_binding.dart';
import '../modules/modules_profile/account_setting/views/account_setting_view.dart';
import '../modules/modules_profile/detail_membership/bindings/detail_membership_binding.dart';
import '../modules/modules_profile/detail_membership/views/detail_membership_view.dart';
import '../modules/modules_profile/faq/bindings/faq_binding.dart';
import '../modules/modules_profile/faq/views/faq_view.dart';
import '../modules/modules_profile/language_setting/bindings/language_setting_binding.dart';
import '../modules/modules_profile/language_setting/views/language_setting_view.dart';
import '../modules/modules_profile/membership/bindings/membership_binding.dart';
import '../modules/modules_profile/membership/views/membership_view.dart';
import '../modules/modules_profile/privacy_policy/bindings/privacy_policy_binding.dart';
import '../modules/modules_profile/privacy_policy/views/privacy_policy_view.dart';
import '../modules/modules_profile/profile/bindings/profile_binding.dart';
import '../modules/modules_profile/profile/views/profile_view.dart';
import '../modules/modules_profile/profile_edit/bindings/profile_edit_binding.dart';
import '../modules/modules_profile/profile_edit/views/profile_edit_view.dart';
import '../modules/modules_profile/profile_edit_name/bindings/profile_edit_name_binding.dart';
import '../modules/modules_profile/profile_edit_name/views/profile_edit_name_view.dart';
import '../modules/modules_profile/profile_edit_password/bindings/profile_edit_password_binding.dart';
import '../modules/modules_profile/profile_edit_password/views/profile_edit_password_view.dart';
import '../modules/modules_profile/profile_setting/bindings/profile_setting_binding.dart';
import '../modules/modules_profile/profile_setting/views/profile_setting_view.dart';
import '../modules/modules_profile/profile_update_address/bindings/profile_update_address_binding.dart';
import '../modules/modules_profile/profile_update_address/views/profile_update_address_view.dart';
import '../modules/modules_profile/profile_update_email/bindings/profile_update_email_binding.dart';
import '../modules/modules_profile/profile_update_email/views/profile_update_email_view.dart';
import '../modules/modules_profile/profile_update_phone/bindings/profile_update_phone_binding.dart';
import '../modules/modules_profile/profile_update_phone/views/profile_update_phone_view.dart';
import '../modules/modules_profile/reward/bindings/reward_binding.dart';
import '../modules/modules_profile/reward/views/reward_view.dart';
import '../modules/modules_profile/reward_history/bindings/reward_history_binding.dart';
import '../modules/modules_profile/reward_history/views/reward_history_view.dart';
import '../modules/modules_profile/website/bindings/website_binding.dart';
import '../modules/modules_profile/website/views/website_view.dart';
import '../modules/modules_survey/rating_product/bindings/rating_product_binding.dart';
import '../modules/modules_survey/rating_product/views/rating_product_view.dart';
import '../modules/modules_survey/rating_services/bindings/rating_services_binding.dart';
import '../modules/modules_survey/rating_services/views/rating_services_view.dart';
import '../modules/modules_survey/survey/bindings/survey_binding.dart';
import '../modules/modules_survey/survey/views/survey_view.dart';
import '../modules/modules_survey/survey_complain/bindings/survey_complain_binding.dart';
import '../modules/modules_survey/survey_complain/views/survey_complain_view.dart';
import '../modules/modules_system_support/system_support/bindings/system_support_binding.dart';
import '../modules/modules_system_support/system_support/views/system_support_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/product_detail/bindings/product_detail_binding.dart';
import '../modules/product_detail/views/product_detail_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/support_detail/bindings/support_detail_binding.dart';
import '../modules/support_detail/views/support_detail_view.dart';
import '../modules/underdevelopment/bindings/underdevelopment_binding.dart';
import '../modules/underdevelopment/views/underdevelopment_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;
  static const mainApp = Routes.appMain;

  static final routes = [
    // NOTE: MODULE HOME
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),

    // NOTE: MODULE AUTH
    GetPage(
      name: _Paths.signIn,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.signUp,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.addEmail,
      page: () => const AddEmailView(),
      binding: AddEmailBinding(),
    ),
    GetPage(
      name: _Paths.forgotPassword,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.otp,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),

    // NOTE: MODULE HISTORY
    GetPage(
      name: _Paths.history,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.historyDetail,
      page: () => const HistoryDetailView(),
      binding: HistoryDetailBinding(),
    ),

    // NOTE: MODULE REWARD
    GetPage(
      name: _Paths.reward,
      page: () => const RewardView(),
      binding: RewardBinding(),
    ),
    GetPage(
      name: _Paths.rewardHistory,
      page: () => const RewardHistoryView(),
      binding: RewardHistoryBinding(),
    ),
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),

    // NOTE: MODULE PROFILE
    GetPage(
      name: _Paths.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.faq,
      page: () => const FaqView(),
      binding: FaqBinding(),
    ),
    GetPage(
      name: _Paths.profileEditPassword,
      page: () => const ProfileEditPasswordView(),
      binding: ProfileEditPasswordBinding(),
    ),
    GetPage(
      name: _Paths.profileSetting,
      page: () => const ProfileSettingView(),
      binding: ProfileSettingBinding(),
    ),
    GetPage(
      name: _Paths.accountSetting,
      page: () => const AccountSettingView(),
      binding: AccountSettingBinding(),
    ),
    GetPage(
      name: _Paths.profileEditName,
      page: () => const ProfileEditNameView(),
      binding: ProfileEditNameBinding(),
    ),

    // NOTE: MODULE SYSTEM SUPPORT
    GetPage(
      name: _Paths.systemSupport,
      page: () => const SystemSupportView(),
      binding: SystemSupportBinding(),
    ),
    GetPage(
      name: _Paths.productDetail,
      page: () => const ProductDetailView(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: _Paths.appMain,
      page: () => const AppMainView(),
      binding: AppMainBinding(),
    ),
    GetPage(
      name: _Paths.resetPassword,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.privacyPolicy,
      page: () => const PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.website,
      page: () => const WebsiteView(),
      binding: WebsiteBinding(),
    ),
    GetPage(
      name: _Paths.notification,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.underDevelopment,
      page: () => const UnderdevelopmentView(),
      binding: UnderdevelopmentBinding(),
    ),
    GetPage(
      name: _Paths.profileUpdateEmail,
      page: () => const ProfileUpdateEmailView(),
      binding: ProfileUpdateEmailBinding(),
    ),
    GetPage(
      name: _Paths.profileUpdatePhone,
      page: () => const ProfileUpdatePhoneView(),
      binding: ProfileUpdatePhoneBinding(),
    ),
    GetPage(
      name: _Paths.profileUpdateAddress,
      page: () => const ProfileUpdateAddressView(),
      binding: ProfileUpdateAddressBinding(),
    ),
    GetPage(
      name: _Paths.ratingService,
      page: () => const RatingServicesView(),
      binding: RatingServicesBinding(),
    ),
    GetPage(
      name: _Paths.languageSetting,
      page: () => const LanguageSettingView(),
      binding: LanguageSettingBinding(),
    ),
    GetPage(
      name: _Paths.profileEdit,
      page: () => ProfileEditView(),
      binding: ProfileEditBinding(),
    ),
    GetPage(
      name: _Paths.membership,
      page: () => const MembershipView(),
      binding: MembershipBinding(),
    ),
    GetPage(
      name: _Paths.detailMembership,
      page: () => const DetailMembershipView(),
      binding: DetailMembershipBinding(),
    ),
    GetPage(
      name: _Paths.survey,
      page: () => const SurveyView(),
      binding: SurveyBinding(),
    ),
    GetPage(
      name: _Paths.surveyComplain,
      page: () => const SurveyComplainView(),
      binding: SurveyComplainBinding(),
    ),
    GetPage(
      name: _Paths.ratingProduct,
      page: () => const RatingProductView(),
      binding: RatingProductBinding(),
    ),
    GetPage(
      name: _Paths.accountSecurity,
      page: () => const AccountSecurityView(),
      binding: AccountSecurityBinding(),
    ),
    GetPage(
      name: _Paths.supportDetail,
      page: () => const SupportDetailView(),
      binding: SupportDetailBinding(),
    ),
    GetPage(
      name: _Paths.listSupport,
      page: () => const ListSupportView(),
      binding: ListSupportBinding(),
    ),
  ];
}
