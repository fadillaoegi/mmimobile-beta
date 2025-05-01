class ApiApps {
  // NOTE: ROOT API
  static const root = "https://mmi.entis.app/api";

  // NOTE: ROOT LOCAL
  // static const root = "http://192.168.1.19/EntIS-MMI/api";

  // NOTE: Ui Avatar
  // static const avatar = "https://ui-avatars.com/api/?name=John+Doe";

  // NOTE: SLIDER IMAGE PATCH
  static const assetPatch = "https://mmi.entis.app/uploads/";

  // NOTE: GET DATA
  static const getUser = "$root/getUser";
  static const getDataSlider = "$root/getDataSlider";
  static const getDataArticle = "https://mashmoshem.co.id/wp-json/wp/v2/posts";

  // NOTE: HOME
  static const getHighlightData = "$root/getHighlightData";

  // NOTE: SYSTEM SUPPORT
  static const listSupportSystem = "$root/listSupportSystem";

  // NOTE: CUSTOMER AUTH API
  static const signIn = "$root/signin";
  static const resetPassword = "$root/resetPassword";
  static const updatePassword = "$root/updatePassword";
  static const updatePhone = "$root/updatePhone";
  static const updateEmail = "$root/updateEmail";
  static const updateName = "$root/updateName";
  static const updateAdress = "$root/updateAdress";
  static const updateProfileFull = "$root/updateProfileFull";

  // NOTE: CUSTONER HISTORY
  static const history = "$root/historySO";
  static const historyDetail = "$root/historyDetail";

  // NOTE: MEMBERSHIP
  static const membershipData = "$root/membershipData";
  static const membershipDataId = "$root/membershipDataId";
  static const membershipDataBenefitId = "$root/membershipDataBenefitId";
}
