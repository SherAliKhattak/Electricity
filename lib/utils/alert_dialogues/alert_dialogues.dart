import 'dart:developer';

import 'package:electricity/data/controllers/language_controller.dart';
import 'package:electricity/models/language_model.dart';
import 'package:electricity/ui/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

LanguageModel selected = LanguageModel(id: 1, name: 'English', locale: const Locale('en', 'US'));

Future<String?> languageSelector(
      BuildContext context, List<LanguageModel> languageList) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) =>
          StatefulBuilder(builder: (context, newState) {
        return AlertDialog(
          
          backgroundColor: Theme.of(context).primaryColorDark,
          title: Text(
            'Select Language',
            style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
          ),
          content: SingleChildScrollView(
            child: SizedBox(
              
              width: Get.width,
              child: GetBuilder<LanguageController>(
                
                builder: (cont) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: languageList.length,
                    itemBuilder: (context,index){
                      final lang = languageList[index];
                    return  RadioListTile<LanguageModel>(
                     
                      activeColor: Colors.black,
                      value: lang , groupValue: selected, onChanged: (LanguageModel? lang){
                      log('$index......1.23');
                    if(lang != null){
                     newState(() {
                          cont.updateSelectedIndex(index);
                      cont.updateLocale(lang.locale!);
                     },);
                    }
                    },
                    title:  Text(lang.name!, style: const TextStyle(color: kwhiteColor),),
                    );
                  });
                }
              ),
            )
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kprimaryColor),
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel')),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ksecondaryColor),
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('Ok',style: TextStyle(color: Colors.black),)),
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }