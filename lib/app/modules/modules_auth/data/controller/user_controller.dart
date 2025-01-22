import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mmimobile/app/data/models/user_model.dart';

class UserController extends GetxController {
  final _user = User().obs;
  User get user => _user.value;
  setData(data) => _user.value = data;
}
