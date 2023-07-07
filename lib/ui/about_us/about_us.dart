import 'package:electricity/ui/common/colors.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhiteColor,
      appBar: AppBar(
        title: const Text('About us'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(
                child: Expanded(
                    child: Text(
                        'Welcome to our app! We\'re a team of passionate developers who believe in the power of technology to make people\'s lives easier and more enjoyable.\n\nOur app was born out of a desire to create a simple, intuitive tool that helps users achieve their goals. We saw a need for an app that could seamlessly integrate different tasks and functions, without sacrificing usability or efficiency. That\'s why we created this app - to provide a streamlined experience that makes everyday life a little bit easier.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Bibendum neque egestas congue quisque egestas diam in arcu cursus. Pulvinar etiam non quam lacus. Elementum nisi quis eleifend quam adipiscing vitae proin sagittis nisl. Mauris vitae ultricies leo integer malesuada nunc vel. Urna porttitor rhoncus dolor purus. Accumsan sit amet nulla facilisi morbi tempus. Elementum curabitur vitae nunc sed velit dignissim sodales ut.\n\n Diam sollicitudin tempor id eu nisl nunc mi ipsum faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada. Euismod quis viverra nibh cras pulvinar mattis nunc sed blandit. Amet venenatis urna cursus eget. Elementum nibh tellus molestie nunc non blandit massa enim nec. Purus faucibus ornare suspendisse sed nisi lacus sed. Neque ornare aenean euismod elementum nisi. Amet purus gravida quis blandit turpis. Feugiat nisl pretium fusce id velit ut tortor. Facilisi cras fermentum odio eu feugiat pretium nibh. Dui nunc mattis enim ut. Nisl suscipit adipiscing bibendum est ultricies integer quis.\n\nArcu felis bibendum ut tristique et. Aliquam ultrices sagittis orci a scelerisque purus semper eget duis. Massa tempor nec feugiat nisl pretium fusce id velit ut. Sed odio morbi quis commodo odio. Senectus et netus et malesuada fames ac turpis egestas. Id velit ut tortor pretium viverra suspendisse potenti nullam. Dui sapien eget mi proin sed libero enim sed faucibus. Porttitor lacus luctus accumsan tortor posuere ac ut consequat semper. Nunc mattis enim ut tellus. Habitasse platea dictumst quisque sagittis. Et malesuada fames ac turpis egestas sed.')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
