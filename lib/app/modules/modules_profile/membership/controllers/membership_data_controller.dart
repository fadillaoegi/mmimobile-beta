import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/data/models/membership/membership_data_model.dart';

class MembershipDataController extends GetxController {
  final _membershipData = MembershipData().obs;
  MembershipData get membershipData => _membershipData.value;
  setData(data) => _membershipData.value = data;
}
