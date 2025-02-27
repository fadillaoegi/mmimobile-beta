class ApiApps {
  // NOTE: ROOT API
  static const root = "https://mmi.entis.app/api";

  // NOTE: ROOT LOCAL
  // static const root = "http://190.110.0.38/EntIS-MMI/api";

  // NOTE: CUSTOMER AUTH API
  static const signIn = "$root/signin";
  static const resetPassword = "$root/resetPassword";
  static const updatePassword = "$root/updatePassword";
  static const updatePhone = "$root/updatePhone";
  static const updateEmail = "$root/updateEmail";
  static const updateName = "$root/updateName";
  static const updateAdress = "$root/updateAdress";

  // NOTE: CUSTONER HISTORY
  static const history = "$root/historySO";
  static const historyDetail = "$root/historyDetail";
}
