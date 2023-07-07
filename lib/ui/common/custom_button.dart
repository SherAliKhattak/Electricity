import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'colors.dart';

class Custombutton extends StatelessWidget {
  final String? title;
  final Function() onPresse;
  final Widget? child;
  final Color? color;
  final EdgeInsetsGeometry? margin;

  const Custombutton({
    Key? key,
    required this.onPresse,
    this.child,
    this.margin,
    this.title,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPresse,
      child: Container(
        width: Get.width ,
        margin: margin,
        height: Get.height * .05,
        decoration: BoxDecoration(
            color: color ?? kprimaryColor,
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: child ??
              Text(
              title!,
                style: const TextStyle(
                    color: ksecondaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
        ),
      ),
    );
  }
}
