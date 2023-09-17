import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../views/pages/Home_Screen/home_controller.dart';

Widget homeAppBar() {
  final HomeController controller = Get.find();
  return AppBar(
    title: Center(
      child: Text(
        'Расписание СФ УУНиТ',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
