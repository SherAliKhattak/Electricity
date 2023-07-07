// ignore_for_file: file_names
import 'dart:developer';
import 'package:electricity/data/controllers/grid_info_controller.dart';
import 'package:electricity/ui/common/images.dart';
import 'package:electricity/ui/common/custom_button.dart';
import 'package:electricity/ui/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/colors.dart';

class GridInfoScreen extends StatefulWidget {
  const GridInfoScreen({super.key});

  @override
  State<GridInfoScreen> createState() => _GridInfoScreenState();
}

class _GridInfoScreenState extends State<GridInfoScreen> {
  @override
  void initState() {


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: GetBuilder<GridInfoController>(builder: (contr) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: Get.height * .03,
                ),
                Image.asset(
                  Images.electric,
                  height: Get.height * .33,
                ),
                const Text(
                    textAlign: TextAlign.center,
                    'Please provide valid\ninformation',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const Text(
                  'District',
                  style: TextStyle(color: kblack45Color),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                DropdownButtonFormField(
                  isDense: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(gapPadding: 20)),
                  value: GridInfoController.i.district,
                  borderRadius: BorderRadius.circular(10),
                  hint: const Text('Select a District'),
                  items: contr.districts.map((e) {
                    GridInfoController.i.districtName = e.name!;
                    return DropdownMenuItem(
                        value: e.id.toString(), child: Text(e.name!));
                  }).toList(),
                  onChanged: (newValue) {
                    contr.updateDistrict(newValue!);
                    log(newValue);
                  },
                  isExpanded: true,
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                const Text(
                  'Feeders',
                  style: TextStyle(color: kblack45Color),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                DropdownButtonFormField(
                  isDense: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(gapPadding: 20)),
                  value: contr.feeder,
                  borderRadius: BorderRadius.circular(10),
                  hint: const Text('Select a Feeder'),
                  items: contr.tempfeedersList.map((e) {
                    GridInfoController.i.feederName = e.name;
                    return DropdownMenuItem(
                        value: e.id.toString(), child: Text(e.name!));
                  }).toList(),
                  onChanged: (newValue) {
                    contr.updateFeeder(newValue!);
                    log(newValue);
                  },
                  isExpanded: true,
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                const Text(
                  'Towns(Kasba)',
                  style: TextStyle(color: kblack45Color),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                DropdownButtonFormField(
                  isDense: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(gapPadding: 20)),
                  value: contr.town,
                  borderRadius: BorderRadius.circular(10),
                  hint: const Text('Select a Town'),
                  items: contr.tempTownsList.map((e) {
                    GridInfoController.i.townName = e.name!;
                    return DropdownMenuItem(
                        value: e.id.toString(), child: Text(e.name!));
                  }).toList(),
                  onChanged: (newValue) {
                    contr.updateTown(newValue!);
                    log(newValue);
                  },
                  isExpanded: true,
                ),
                Custombutton(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
                  onPresse: () async{
                 await  GridInfoController.i.searchData();
                  Get.offAll(()=>const  Dashboard());
                    log('get Started'.toString());
                GridInfoController.i.weeklyHours =  GridInfoController.i.calculateTotalDuration(GridInfoController.i.weeklyData);
                GridInfoController.i.monthlyHours = GridInfoController.i.calculateTotalDuration(GridInfoController.i.yearlyData);
                GridInfoController.i.todayHousr = GridInfoController.i.addDurationToList( GridInfoController.i.todayData);
                GridInfoController.i.dailyHours = GridInfoController.i.addDurationToList( GridInfoController.i.dailyData);
                
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Next',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ksecondaryColor)),
                      Image.asset(Images.lightning)
                    ],
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
