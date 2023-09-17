import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../service/theme_service.dart';
import '../../views/pages/Home_Screen/home_controller.dart';

Widget lettersList() {
  final HomeController controller = Get.find();
  return Column(
    children: [
      ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.lettersList.length,
          itemBuilder: (context, index1) {
            return Container(
              margin: EdgeInsets.only(left: 3.0, right: 3.0, bottom: 1.0),
              child: GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.lettersList[index1].length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 100.0,
                    mainAxisExtent: 40,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(1.5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ThemeService.primaryColor,
                          border: Border.all(
                            color: ThemeService.cardColor,
                            width: 2.5,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: GestureDetector(
                          child: Container(
                            child: Center(
                              child: Text(
                                controller.lettersList[index1].values
                                    .toList()[index],
                                style: TextStyle(
                                  color: ThemeService.bodyText1,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            controller.getTeachersList(controller
                                .lettersList[index1].keys
                                .toList()[index]);
                          },
                        ),
                      ),
                    );
                  }),
            );
          }),
      GetBuilder<HomeController>(builder: (controller) {
        return ListView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.teachersList.length,
            itemBuilder: (context, index1) {
              return Container(
                margin: EdgeInsets.only(left: 3.0, right: 3.0, bottom: 1.0),
                child: GridView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.teachersList[index1].length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200.0,
                      mainAxisExtent: 40,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 1.0,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(1.5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: ThemeService.cardColor,
                            border: Border.all(
                              color: ThemeService.primaryColor,
                              width: 2.5,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: GestureDetector(
                            child: Container(
                              child: Center(
                                child: Text(
                                  controller.teachersList[index1].values
                                      .toList()[index],
                                  style: TextStyle(
                                    color: ThemeService.bodyText2,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Get.toNamed('/schedule', arguments: {
                                'type': '1',
                                'id':
                                    '${controller.teachersList[index1].keys.toList()[index]}',
                                'name':
                                    '${controller.teachersList[index1].values.toList()[index]}',
                                'week': 0
                              });
                            },
                          ),
                        ),
                      );
                    }),
              );
            });
      })
    ],
  );
}
