import 'package:e_commerce_front_getx/presentation/profile/model/profile_screen_model.dart';

import '../../../core/app_export.dart';

import 'package:e_commerce_front_getx/data/api_client/api_client.dart';
import 'package:e_commerce_front_getx/data/models/user/user_request_model.dart';

import '../../../data/models/address/address_response_model.dart';

class ProfileScreenController extends GetxController {
  final UserRepository _userRepository = Get.find();
  final AddressRepository _addressRepository = Get.find();

  Rx<UserModel?> userModel = UserModel().obs;
  RxList<AddressResponseModel> addressModel = <AddressResponseModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getUser();
    getAdress();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getUser() async {
    var user = await _userRepository.getUser(UserRequestModel());

    userModel.value = UserModel(
      id: user?.id,
      email: user?.email,
      name: user?.name,
      firstname: user?.firstname,
      role: user?.role,
    );
  }

  getAdress() async {
    var adress = await _addressRepository.getAdress();
    addressModel.value = adress;
  }

  Future<int?> getAddressLenght() async {
    //faire en sorte que ca appel 1 fois si il y a 0 adresse
    if (addressModel.isEmpty) {
      await getAdress();
    }
    print('refresh');
    return addressModel.length;
  }
}
