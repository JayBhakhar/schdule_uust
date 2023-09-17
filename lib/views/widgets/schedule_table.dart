import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../service/theme_service.dart';
import '../../views/pages/Schedule/schedule_controller.dart';

Widget scheduleTable() {
  final ScheduleController controller = Get.find();

  return Column(
    children: [
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ThemeService.cardColor,
              border: Border.all(
                color: ThemeService.primaryColor,
                width: 0.6,
              ),
            ),
            child: Center(
              child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    '${controller.dayList[0]}',
                    style: TextStyle(
                      color: ThemeService.bodyText2,
                    ),
                  )),
            ),
          ),
          ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.day1Lec.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: ThemeService.primaryColor,
                      width: 0.6,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${controller.lecNoList[index]} ${controller.lecTypeList[index]} ${controller.lecCabList[index]}'),
                            
                            Text(
                              '${controller.lecTimeList[index]}',
                            ),
                            
                          ],
                        ),
                        Text(
                          '${controller.lecNameList[index]}',
                        ),
                        
                        Text(
                          '${controller.teacherNameList[index]}${controller.groupList[index]}',
                        ),
                        
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ThemeService.cardColor,
              border: Border.all(color: ThemeService.primaryColor, width: 0.6),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  '${controller.dayList[1]}',
                ),
              ),
            ),
          ),
          ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.day2Lec.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: ThemeService.primaryColor,
                      width: 0.6,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${controller.lecNoList[controller.forday2 + index]} ${controller.lecTypeList[controller.forday2 + index]} ${controller.lecCabList[controller.forday2 + index]}',
                            ),
                            
                            Text(
                              '${controller.lecTimeList[controller.forday2 + index]}',
                            ),
                            
                          ],
                        ),
                        Text(
                          '${controller.lecNameList[controller.forday2 + index]}',
                        ),
                        
                        Text(
                          '${controller.teacherNameList[controller.forday2 + index]}${controller.groupList[controller.forday2 + index]}',
                        ),
                        
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ThemeService.cardColor,
              border: Border.all(color: ThemeService.primaryColor, width: 0.6),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  '${controller.dayList[2]}',
                ),
              ),
            ),
          ),
          ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.day3Lec.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: ThemeService.primaryColor,
                      width: 0.6,
                    ),
                  ),
                  width: 10,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${controller.lecNoList[controller.forday3 + index]} ${controller.lecTypeList[controller.forday3 + index]} ${controller.lecCabList[controller.forday3 + index]}',
                            ),
                            
                            Text(
                              '${controller.lecTimeList[controller.forday3 + index]}',
                            ),
                            
                          ],
                        ),
                        Text(
                          '${controller.lecNameList[controller.forday3 + index]}',
                        ),
                        
                        Text(
                          '${controller.teacherNameList[controller.forday3 + index]}${controller.groupList[controller.forday3 + index]}',
                        ),
                        
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ThemeService.cardColor,
              border: Border.all(
                color: ThemeService.primaryColor,
                width: 0.6,
              ),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  '${controller.dayList[3]}',
                ),
              ),
            ),
          ),
          ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.day4Lec.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: ThemeService.primaryColor,
                      width: 0.6,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${controller.lecNoList[controller.forday4 + index]} ${controller.lecTypeList[controller.forday4 + index]} ${controller.lecCabList[controller.forday4 + index]}',
                            ),
                            
                            Text(
                              '${controller.lecTimeList[controller.forday4 + index]}',
                            ),
                            
                          ],
                        ),
                        Text(
                          '${controller.lecNameList[controller.forday4 + index]}',
                        ),
                        
                        Text(
                          '${controller.teacherNameList[controller.forday4 + index]}${controller.groupList[controller.forday4 + index]}',
                        ),
                        
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ThemeService.cardColor,
              border: Border.all(color: ThemeService.primaryColor, width: 0.6),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  '${controller.dayList[4]}',
                ),
              ),
            ),
          ),
          ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.day5Lec.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: ThemeService.primaryColor,
                      width: 0.6,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${controller.lecNoList[controller.forday5 + index]} ${controller.lecTypeList[controller.forday5 + index]} ${controller.lecCabList[controller.forday5 + index]}',
                            ),
                            
                            Text(
                              '${controller.lecTimeList[controller.forday5 + index]}',
                            ),
                            
                          ],
                        ),
                        Text(
                          '${controller.lecNameList[controller.forday5 + index]}',
                        ),
                        
                        Text(
                          '${controller.teacherNameList[controller.forday5 + index]}${controller.groupList[controller.forday5 + index]}',
                        ),
                        
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ThemeService.cardColor,
              border: Border.all(color: ThemeService.primaryColor, width: 0.6),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  '${controller.dayList[5]}',
                ),
              ),
            ),
          ),
          ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.day6Lec.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: ThemeService.primaryColor,
                      width: 0.6,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${controller.lecNoList[controller.forday6 + index]} ${controller.lecTypeList[controller.forday6 + index]} ${controller.lecCabList[controller.forday6 + index]}',
                            ),
                            
                            Text(
                              '${controller.lecTimeList[controller.forday6 + index]}',
                            ),
                            
                          ],
                        ),
                        Text(
                          '${controller.lecNameList[controller.forday6 + index]}',
                        ),
                        
                        Text(
                          '${controller.teacherNameList[controller.forday6 + index]}${controller.groupList[controller.forday6 + index]}',
                        ),
                        
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    ],
  );
}
