import 'dart:developer';

import 'package:electricity/data/controllers/grid_info_controller.dart';
import 'package:electricity/data/repos/load_shedding_repo.dart';
import 'package:electricity/models/load_shedding_data_model.dart';
import 'package:electricity/models/load_shedding_model.dart';
import 'package:get/get.dart';

class LoadsheddingController extends GetxController implements GetxService{
  List<LoadsheddingDataModel>? loadsheddinglist = [];

  getLoadshedding() async
  {
    Loadshedding loadsheddingData = await LoadSheddingRepo().getLoadSheddingData();
    loadsheddinglist = loadsheddingData.data;
    log('The loadshedding List is $loadsheddinglist');
    update();
  }

  @override
  void onInit() {
      
      GridInfoController.i.populateDropdown();
      getLoadshedding();
    super.onInit();
  }
   static LoadsheddingController get i => Get.put(LoadsheddingController());
}
