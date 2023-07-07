import 'package:electricity/ui/about_us/about_us.dart';
import 'package:electricity/ui/common/colors.dart';
import 'package:electricity/ui/common/images.dart';
import 'package:electricity/utils/alert_dialogues/alert_dialogues.dart';
import 'package:electricity/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../../../data/controllers/auth_controller.dart';
import '../../grid_Info/grid_info_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: ListView(
            children: [
               Text(
                textAlign: TextAlign.center,
                'profile'.tr,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: Get.height * .02,
              ),
              GetBuilder<AuthController>(builder: (contr) {
                return Container(
                  height: 140,
                  width: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                      image: contr.file == null
                          ? const DecorationImage(
                              image: AssetImage(Images.profile))
                          : DecorationImage(image: FileImage(contr.file!),fit: BoxFit.fill)),
                  child: IconButton(
                      onPressed: () {
                        AuthController.i.pickImage(context);
                      },
                      icon: const Icon(
                        Icons.camera_alt,
                        color: kwhiteColor,
                        size: 50,
                      )),
                );
              }),
              SizedBox(
                height: Get.height * .02,
              ),
              Text(
                textAlign: TextAlign.center,
                AuthController.i.name.text,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.symmetric(horizontal: 110),
                  decoration: BoxDecoration(
                      color: kprimaryColor1,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(
                        'editProfile'.tr,
                        style: const TextStyle(color: ksecondaryColor),
                      ),
                      SizedBox(
                        width: Get.width * .02,
                      ),
                      Image.asset(
                        Images.edit,
                        height: Get.height * .02,
                        color: ksecondaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * .03,
              ),
              GridEditButton(
                onTap: () {
                  Get.to(const GridInfoScreen());
                },
              ),
              ListTile(
                onTap: (){},
                horizontalTitleGap: 1,
                contentPadding: EdgeInsets.zero,
                leading:
                    Image.asset(Images.notification, height: Get.height * .03),
                title:  Text('notifications'.tr),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children:  [
                    Text(
                      'ON'.tr,
                      style:const  TextStyle(color: kblack45Color),
                    ),
                   const  Icon(
                      Icons.keyboard_arrow_right,
                      color: kblackColor,
                    )
                  ],
                ),
              ),
              ListTile(
                onTap: (){
                  languageSelector(context, APPConstants.languages);
                },
                horizontalTitleGap: 1,
                contentPadding: EdgeInsets.zero,
                leading: Image.asset(Images.language, height: Get.height * .03),
                title:  Text('language'.tr),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'English',
                      style: TextStyle(color: kblack45Color),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: kblackColor,
                    )
                  ],
                ),
              ),
              const Text(
                'Support',
                style: TextStyle(
                    color: kprimaryColor1,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              ListTile(
                onTap: (){
                  Share.share('Check out my App ');
                },
                horizontalTitleGap: 1,
                contentPadding: EdgeInsets.zero,
                leading: Image.asset(Images.share, height: Get.height * .03),
                title:  Text('Share'.tr),
              ),
              ListTile(
                onTap: (){},
                horizontalTitleGap: 1,
                contentPadding: EdgeInsets.zero,
                leading: Image.asset(Images.rating, height: Get.height * .03),
                title:  Text('rateUs'.tr),
              ),
              ListTile(
                onTap: (){},
                horizontalTitleGap: 1,
                contentPadding: EdgeInsets.zero,
                leading: Image.asset(Images.moreapp, height: Get.height * .03),
                title: const Text('More Apps'),
              ),
              ListTile(
                onTap: (){
                  Get.to(const AboutUs());
                },
                horizontalTitleGap: 1,
                contentPadding: EdgeInsets.zero,
                leading: Image.asset(Images.about, height: Get.height * .03),
                title:  Text('aboutus'.tr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GridEditButton extends StatelessWidget {
  final Function() onTap;
  const GridEditButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: Get.height * .06,
        decoration: BoxDecoration(
            color: const Color(0xffF4F4F4),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Text(
                  'distric,',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  'town,',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  'feeder',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                )
              ],
            ),
            Row(
              children: const [
                Text(
                  'Change',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Icon(Icons.keyboard_arrow_right)
              ],
            )
          ],
        ),
      ),
    );
  }
}
