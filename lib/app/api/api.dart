class ApiApps {
  // NOTE: ROOT API
  static const root = "https://mmi.entis.app/api";

  // NOTE: ROOT LOCAL
  // static const root = "http://192.168.1.10/EntIS-MMI/api"; // WIFI KOST
  // static const root = "http://190.110.0.54/EntIS-MMI/api"; // WIFI KANTOR

  // NOTE: CUSTOMER AUTH API
  static const signIn = "$root/signin";
  static const resetPassword = "$root/resetPassword";
  static const updatePassword = "$root/updatePassword";
  static const updatePhone = "$root/updatePhone";
  static const updateEmail = "$root/updateEmail";
  static const updateName = "$root/updateName";
  static const updateAdress = "$root/updateAdress";
}
