import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../consts/consts.dart';
import '../../../service/theme_service.dart';
import '../../widgets/buildings_list.dart';
import '../../widgets/groups_list.dart';
import '../../widgets/home_appbar.dart';
import '../../widgets/letters_list.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: homeAppBar(),
      ),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Column(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: faculty.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    box.write('isFMaIT', false);
                    controller.index = index;
                    if (index == 0) {
                      controller.facultyId = 4;
                      controller.getGroupsList();
                    } else if (index == 1) {
                      controller.facultyId = 5;
                      controller.getGroupsList();
                    } else if (index == 2) {
                      controller.facultyId = 6;
                      controller.getGroupsList();
                    } else if (index == 3) {
                      box.write('isFMaIT', true);
                      controller.facultyId = 7;
                      controller.getGroupsList();
                    } else if (index == 4) {
                      controller.facultyId = 8;
                      controller.getGroupsList();
                    } else if (index == 5) {
                      controller.facultyId = 9;
                      controller.getGroupsList();
                    } else if (index == 6) {
                      controller.facultyId = 10;
                      controller.getGroupsList();
                    } else if (index == 7) {
                      controller.facultyId = 18;
                      controller.getGroupsList();
                    } else if (index == 8) {
                      controller.facultyId = 26;
                      controller.getGroupsList();
                    } else if (index == 9) {
                      controller.facultyId = 27;
                      controller.getGroupsList();
                    } else if (index == 10) {
                      controller.facultyId = 127;
                      controller.getGroupsList();
                    } else if (index == 11) {
                      controller.getLettersList();
                    } else if (index == 12) {
                      controller.getBuildingsList();
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: ThemeService.cardColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.only(top: 1.5),
                    child: Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: Text(
                        faculty[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ThemeService.bodyText2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            GetBuilder<HomeController>(builder: (controller) {
              if (controller.index <= 10) {
                return controller.isLoading
                    ? CircularProgressIndicator()
                    : groupsList();
                // ignore: unrelated_type_equality_checks
              } else if (controller.index == 11) {
                return controller.isLoading
                    ? CircularProgressIndicator()
                    : lettersList();
                // ignore: unrelated_type_equality_checks
              } else if (controller.index == 12) {
                return controller.isLoading
                    ? CircularProgressIndicator()
                    : buildingsList();
              } else {
                return Container();
              }
            }),
          ],
        ),
      ),
    );
  }
}
