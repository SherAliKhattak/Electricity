import 'dart:convert';
import 'dart:developer';
import 'package:electricity/data/controllers/grid_info_controller.dart';
import 'package:electricity/data/services/local_db/local_db.dart';
import 'package:electricity/models/districts_data_model.dart';
import 'package:electricity/models/load_shedding_model.dart';
import 'package:electricity/ui/common/colors.dart';
import 'package:electricity/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart ' as http;

import '../../ui/common/snackbar.dart';

class GridInfoRepo{

  getDistrictsData() async {
    var token = await PreferenceService().getToken();
    log('token in getDistrictsData is$token');
    var res = await http.get(Uri.parse(APPConstants.baseURL + APPConstants.treeDataURI),headers: {
      'Authorization': 'Bearer $token'
    });
    if(res.statusCode == 200)
    {
      final json = DistrictsData.fromJson(jsonDecode(res.body));
      return json;
    }
    else
    {
      showSnackbar(Get.context!, jsonDecode(res.body)['message']?? 'An Unknown Error occured', color: kredColor);
    }
  }

  searchDistrictsData()async
  {
    var token = await PreferenceService().getToken();
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var body = {
      'district_id': GridInfoController.i.district,
      'feeder_id' : GridInfoController.i.feeder,
      'town_id': GridInfoController.i.town,
    };
    var res = await http.post(Uri.parse(APPConstants.baseURL + APPConstants.recordsSearchURI, ),headers:headers,body: body);
    if(res.statusCode == 200)
    {
      final json = Loadshedding.fromJson(jsonDecode(res.body));
      return json;
    }
    if(res.statusCode == 404)
    {
      log('not found');
    }
    else{
      showSnackbar(Get.context!, jsonDecode(res.body)['message']?? 'An Unknown Error occured', color: kredColor);
    }
  }
}