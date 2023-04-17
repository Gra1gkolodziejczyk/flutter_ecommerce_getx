import 'package:e_commerce_front_getx/presentation/profile/model/profile_screen_model.dart';

import '../../../core/app_export.dart';

import 'package:e_commerce_front_getx/data/api_client/api_client.dart';
import 'package:e_commerce_front_getx/data/models/user/user_request_model.dart';

class ProfileScreenController extends GetxController {
  final UserRepository _userRepository = Get.find();

  RxList<UserModel?> userModel = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getUser() async {
    await _userRepository.getUser(UserRequestModel());
  }
}
