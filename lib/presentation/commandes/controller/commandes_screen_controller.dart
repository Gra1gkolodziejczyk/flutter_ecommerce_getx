import 'package:e_commerce_front_getx/data/api_client/api_client.dart';
import 'package:e_commerce_front_getx/data/models/commandes/commandes_response_model.dart';

import '../../../core/app_export.dart';

class CommandesScreenController extends GetxController {
  final CommandesRepository commandesRepository = Get.find();
  RxList<CommandesResponse> commandList = <CommandesResponse>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllMyOrder();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getAllMyOrder() async {
    var response = await commandesRepository.getMyOrders();
    commandList.value = response;
  }

  changeDate() async {}

  Future<int?> getCommandLenght() async {
    print('refresh');
    if (commandList.isEmpty) {
      await getAllMyOrder();
    }
    var length = commandList.length;
    return length;
  }
}
