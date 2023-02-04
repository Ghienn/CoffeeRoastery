import 'package:coffee_roastery/models/coffee_bean.dart';
import 'package:get/get.dart';
import 'package:coffee_roastery/screens/machines/machines_provider';

import '../models/machines.dart';

class MachinesController extends GetxController {
  List<Machines> machinesList = [];
  bool isLoading = true;
  @override
  void onInit() {
    MachinesProvider().getMachinesList(
      onSuccess: (machines) {
        machinesList.clear();
        machinesList.addAll(machines);
        isLoading = false;
        update();
      },
      onError: (error) {
        isLoading = false;
        update();
        print("Error");
      },
    );
    super.onInit();
  }
}
