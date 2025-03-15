part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const home = _Paths.home;
  static const splash = _Paths.splash;

  // NOTE: MODULE AUTH
  static const forgotPassword = _Paths.forgotPassword;
  static const otp = _Paths.otp;
  static const signIn = _Paths.signIn;
  static const signUp = _Paths.signUp;

  // NOTE: MODULE HISTORY
  static const history = _Paths.history;
  static const historyDetail = _Paths.historyDetail;

  // NOTE: MODULE REWARD
  static const reward = _Paths.reward;
  static const rewardHistory = _Paths.rewardHistory;

  // NOTE: MODULE PROFILE
  static const faq = _Paths.faq;
  static const profile = _Paths.profile;
  static const profileSetting = _Paths.profileSetting;
  static const profileEditPassword = _Paths.profileEditPassword;

  // NOTE: MODULE SYSTEM SUPPORT
  static const systemSupport = _Paths.systemSupport;
  static const productDetail = _Paths.productDetail;
  static const appMain = _Paths.appMain;
  static const resetPassword = _Paths.resetPassword;
  static const privacyPolicy = _Paths.privacyPolicy;
  static const website = _Paths.website;
  static const notification = _Paths.notification;
  static const underDevelopment = _Paths.underDevelopment;
  static const addEmail = _Paths.addEmail;
  static const accountSetting = _Paths.accountSetting;
  static const profileEditName = _Paths.profileEditName;
  static const profileUpdateEmail = _Paths.profileUpdateEmail;
  static const profileUpdatePhone = _Paths.profileUpdatePhone;
  static const profileUpdateAddress = _Paths.profileUpdateAddress;
  static const ratingService = _Paths.ratingService;
  static const languageSetting = _Paths.languageSetting;
  static const profileEdit = _Paths.profileEdit;
  static const membership = _Paths.membership;
  static const detailMembership = _Paths.detailMembership;
  static const survey = _Paths.survey;
  static const surveyComplain = _Paths.surveyComplain;
  static const ratingProduct = _Paths.ratingProduct;
  static const accountSecurity = _Paths.accountSecurity;
  static const supportDetail = _Paths.supportDetail;
  static const listSupport = _Paths.listSupport;
}

abstract class _Paths {
  _Paths._();
  static const splash = '/splash';
  static const appMain = '/app-main';

  // NOTE: MODULE AUTH
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
  static const resetPassword = '/reset-password';
  static const forgotPassword = '/forgot-password';
  static const otp = '/otp';

  // NOTE: MODULE HOME
  static const home = '/home';

  // NOTE: MODULE HISTORY
  static const history = '/history';
  static const historyDetail = '/history-detail';

  // NOTE: MODULE REWARD
  static const reward = '/reward';
  static const rewardHistory = '/reward-history';

  // NOTE: MODULE PROFILE
  static const profile = '/profile';
  static const profileSetting = '/profile-setting';
  static const faq = '/faq';
  static const profileEditPassword = '/profile-edit-password';

  // NOTE: MODULE SYTEM SUPPORT
  static const systemSupport = '/system-support';
  static const productDetail = '/product-detail';
  static const privacyPolicy = '/privacy-policy';
  static const website = '/website';
  static const notification = '/notification';
  static const underDevelopment = '/underdevelopment';
  static const addEmail = '/add-email';
  static const accountSetting = '/account-setting';
  static const profileEditName = '/profile-edit-name';
  static const profileUpdateEmail = '/profile-update-email';
  static const profileUpdatePhone = '/profile-update-phone';
  static const profileUpdateAddress = '/profile-update-address';
  static const ratingService = '/rating-services';
  static const languageSetting = '/language-setting';
  static const profileEdit = '/profile-edit';
  static const membership = '/membership';
  static const detailMembership = '/detail-membership';
  static const survey = '/survey';
  static const surveyComplain = '/survey-complain';

  static const ratingProduct = '/rating-product';
  static const accountSecurity = '/account-security';
  static const supportDetail = '/support-detail';
  static const listSupport = '/list-support';
}
