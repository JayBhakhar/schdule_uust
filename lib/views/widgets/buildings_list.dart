import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../service/theme_service.dart';
import '../pages/Home_Screen/home_controller.dart';

Widget buildingsList() {
  final HomeController controller = Get.find();
  GetStorage box = GetStorage();
  return Column(
    children: [
      ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.buildingsList.length,
          itemBuilder: (context, index1) {
            return Container(
              margin: EdgeInsets.only(left: 3.0, right: 3.0, bottom: 1.0),
              child: GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.buildingsList[index1].length,
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
                                controller.buildingsList[index1].values
                                    .toList()[index],
                                style: TextStyle(
                                  color: ThemeService.bodyText1,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            box.write('isFMaIT', false);
                            if (index == 2) {
                              box.write('isFMaIT', true);
                            }
                            controller.getRoomsList(controller
                                .buildingsList[index1].keys
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
            itemCount: controller.roomsList.length,
            itemBuilder: (context, index1) {
              return Container(
                margin: EdgeInsets.only(left: 3.0, right: 3.0, bottom: 1.0),
                child: GridView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.roomsList[index1].length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150.0,
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
                                  controller.roomsList[index1].values
                                      .toList()[index],
                                  style: TextStyle(
                                    color: ThemeService.bodyText2,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Get.toNamed('/schedule', arguments: {
                                'type': '3',
                                'id':
                                    '${controller.roomsList[index1].keys.toList()[index]}',
                                'name':
                                    '${controller.roomsList[index1].values.toList()[index]}',
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
