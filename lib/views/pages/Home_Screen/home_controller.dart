import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../service/api_provider.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();
  List groupsList = List.empty();
  List lettersList = List.empty();
  List buildingsList = List.empty();
  List teachersList = List.empty();
  List roomsList = List.empty();
  int facultyId = 0;
  int index = 0;
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      GetStorage box = GetStorage();
      if (box.hasData('data')) {
        Get.toNamed('/schedule');
      }
    });
  }

  void _scontroller() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent == 0.0 ? 350 : 550,
        duration: Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  void getGroupsList() async {
    isLoading = true;
    update();
    var groups = await ApiProvider().getGroupsList();
    if (groups != null) {
      groupsList = groups;
    }
    _scontroller();
    isLoading = false;
    update();
  }

  void getLettersList() async {
    isLoading = true;
    update();
    var letters = await ApiProvider().getLettersList();
    if (letters != null) {
      lettersList = letters;
    }
    _scontroller();
    isLoading = false;
    update();
  }

  void getBuildingsList() async {
    isLoading = true;
    update();
    var buildings = await ApiProvider().getBuildingsList();
    if (buildings != null) {
      buildingsList = buildings;
    }
    _scontroller();
    isLoading = false;
    update();
  }

  void getTeachersList(String letterId) async {
    isLoading = true;
    update();
    var teachers = await ApiProvider().getTeachersList(letterId);
    if (teachers != null) {
      teachersList = teachers;
    }
    _scontroller();
    isLoading = false;
    update();
  }

  void getRoomsList(String roomId) async {
    isLoading = true;
    update();
    var rooms = await ApiProvider().getRoomsList(roomId);
    if (rooms != null) {
      roomsList = rooms;
    }
    _scontroller();
    isLoading = false;
    update();
  }
}
