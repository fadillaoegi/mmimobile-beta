import 'package:flutter/widgets.dart';
import 'package:mmimobile/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  User _dataUser = User();
  User? get dataUser => _dataUser;
  void setDataUser(User user) {
    _dataUser = user;
    notifyListeners();
  }

  // void clearDataUser() {
  //   _dataUser = User(); // Reset ke objek kosong
  //   notifyListeners();
  // }
}
