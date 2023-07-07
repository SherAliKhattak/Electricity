
import 'dart:ui';

import '../models/language_model.dart';

class APPConstants{
   
   static const String appname = 'AppName';
   static const String baseURL = 'https://loadshedding.hostdonor.com';
   static const String loginURI = '/api/login';
   static const String registerURI = '/api/register';
   static const String treeDataURI = '/api/loadshedding';
   static const String recordsURI = '/api/loadshedding/records';
   static const String recordsSearchURI = '/api/loadshedding/search';
  // keys
   static const String token = 'token';
  // weather 
  
  static const String apiKey = 'a49652f4ec188c0a21fe6acbc23cdae8';

static  List<LanguageModel> languages = [
  LanguageModel(
      name: 'English',
      id: 1,
      locale: const Locale('en', 'US')),
  LanguageModel(
      name: 'Spanish',
      id: 2,
      locale: const Locale('es', 'ES')),
 
];
 
}
