
import 'dart:convert';
import 'dart:developer';
import 'package:electricity/models/load_shedding_model.dart';
import '../../utils/app_constants.dart';
import '../services/local_db/local_db.dart';
import 'package:http/http.dart ' as http;

class LoadSheddingRepo{
   getLoadSheddingData() async {
    var token = await PreferenceService().getToken();
    var res = await http.get(Uri.parse(APPConstants.baseURL + APPConstants.recordsURI),headers: {
      'Authorization': 'Bearer $token'
    });
    if(res.statusCode == 200)
    {
      final json = Loadshedding.fromJson(jsonDecode(res.body));
      log(json.toString());
      return json;
      
    }
    if(res.statusCode == 401)
    {
      log(res.statusCode.toString());
    }
  }
}