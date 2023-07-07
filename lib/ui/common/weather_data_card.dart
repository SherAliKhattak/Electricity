import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';

class WeatherDataCard extends StatelessWidget {
  final String image;
  final String value;
  final String title;
  const WeatherDataCard({
    Key? key,
    required this.value,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: Get.height * .030,
        ),
        Text(
          value,
          style: const TextStyle(
              color: ksecondaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 12),
        ),
        Text(title,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w400))
      ],
    );
  }
}
