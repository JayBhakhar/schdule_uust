import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:html/parser.dart';
import '../../../service/api_provider.dart';

class ScheduleController extends GetxController {
  bool isLoading = false;
  dynamic arguments = Get.arguments;
  String schedule = '';
  List dayList = [];
  List lecNoList = [];
  List lecNoList2 = [];
  List lecTypeList = [];
  List lecCabList = [];
  List lecTimeList = [];
  List lecNameList = [];
  List teacherNameAndGroupList = [];
  List teacherNameList = [];
  List groupList = [];
  List day1Lec = [];
  List day2Lec = [];
  List day3Lec = [];
  List day4Lec = [];
  List day5Lec = [];
  List day6Lec = [];
  late int forday2;
  late int forday3;
  late int forday4;
  late int forday5;
  late int forday6;

  GetStorage box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    if (!box.hasData('data')) {
      getSchedule(arguments['type'], arguments['id'], arguments['week']);
    } else {
      var data = box.read('data');
      schedule = data['schedule'];
      if (data['type'] == '3') {
        parsingData3();
      } else {
        parsingData();
      }
    }
    update();
  }

  void resetButton() {
    clearAll();

    if (box.hasData('data')) {
      var data = box.read('data');
      getSchedule(data['type'], data['id'], 0);
    }
  }

  void weekIncrease() {
    clearAll();
    if (box.hasData('data')) {
      var data = box.read('data');
      getSchedule(data['type'], data['id'], data['week'] + 1);
    }
  }

  void weekDecrease() {
    clearAll();
    if (box.hasData('data')) {
      var data = box.read('data');
      getSchedule(data['type'], data['id'], data['week'] - 1);
    }
  }

  void clearAll() {
    dayList = [];
    lecNoList = [];
    lecNoList2 = [];
    lecTypeList = [];
    lecCabList = [];
    lecTimeList = [];
    lecNameList = [];
    teacherNameAndGroupList = [];
    teacherNameList = [];
    groupList = [];
    day1Lec = [];
    day2Lec = [];
    day3Lec = [];
    day4Lec = [];
    day5Lec = [];
    day6Lec = [];
  }

  void getSchedule(String type, String id, int week) async {
    isLoading = true;
    update();
    var body = await ApiProvider().getSchedule(type, id, week);
    if (body != null) {
      schedule = body;
      var data = box.read('data');
      box.write('data', {
        'type': type,
        'name': box.hasData('data') ? data['name'] : arguments['name'],
        'id': id,
        'week': week,
        'schedule': schedule
      });
    }
    var data = box.read('data');
    if (data['type'] == '3') {
      parsingData3();
    } else {
      parsingData();
    }
    isLoading = false;
    update();
  }

  void parsingData3() {
    var document = parse(schedule);
    var getDay = document.getElementsByClassName('day');
    for (var days in getDay) {
      var daylist = days.getElementsByTagName('h2');
      for (var day in daylist) {
        dayList.add(day.innerHtml);
      }
    }

    var getLec = document.getElementsByClassName('lesson');
    for (var number in getLec) {
      if (number.text != '') {
        lecNoList.add(number.text[0] + number.text[1]);
      }
      lecNoList2.add(number.text);
    }

    var day1 = lecNoList2.getRange(0, 8);
    for (var i in day1) {
      if (i != '') {
        day1Lec.add(i);
      }
    }
    var day2 = lecNoList2.getRange(8, 16);
    for (var i in day2) {
      if (i != '') {
        day2Lec.add(i);
      }
    }
    var day3 = lecNoList2.getRange(16, 24);
    for (var i in day3) {
      if (i != '') {
        day3Lec.add(i);
      }
    }
    var day4 = lecNoList2.getRange(24, 32);
    for (var i in day4) {
      if (i != '') {
        day4Lec.add(i);
      }
    }
    var day5 = lecNoList2.getRange(32, 40);
    for (var i in day5) {
      if (i != '') {
        day5Lec.add(i);
      }
    }
    var day6 = lecNoList2.getRange(40, 48);
    for (var i in day6) {
      if (i != '') {
        day6Lec.add(i);
      }
    }

    var getLecType = document.getElementsByClassName('type');
    for (var div1 in getLecType) {
      String lecType = div1.text;
      List a = lecType.split(RegExp(r"[0-9]"));
      lecTypeList.add(a.last);
    }

    var getLecCab = document.getElementsByClassName('cab');
    for (var cab in getLecCab) {
      lecCabList.add(cab.text);
    }

    var getLecTime = document.getElementsByClassName('time');
    for (var time in getLecTime) {
      lecTimeList.add(time.text);
    }

    var getLecName = document.getElementsByClassName('name');
    for (var name in getLecName) {
      lecNameList.add(name.text);
    }

    var getTeacherName = document.getElementsByClassName('prep');
    for (var teacherdiv in getTeacherName) {
      var teacherli = teacherdiv.getElementsByTagName('li');
      for (var teacher in teacherli) {
        teacherNameAndGroupList.add(teacher.text);
      }
    }

    var number = 0;
    for (var i = number; i < teacherNameAndGroupList.length; i++) {
      if (i % 2 == 0) {
        teacherNameList.add(teacherNameAndGroupList[i]);
      } else {
        groupList.add(teacherNameAndGroupList[i]);
      }
    }

    forday2 = day1Lec.length;
    forday3 = day1Lec.length + day2Lec.length;
    forday4 = day1Lec.length + day2Lec.length + day3Lec.length;
    forday5 = day1Lec.length + day2Lec.length + day3Lec.length + day4Lec.length;
    forday6 = day1Lec.length +
        day2Lec.length +
        day3Lec.length +
        day4Lec.length +
        day5Lec.length;
  }

  void parsingData() {
    var document = parse(schedule);
    var getday = document.getElementsByClassName('day');
    for (var days in getday) {
      var daylist = days.getElementsByTagName('h2');
      for (var day in daylist) {
        dayList.add(day.innerHtml);
      }
    }

    var getLecNo = document.getElementsByClassName('number');
    for (var number in getLecNo) {
      if (number.text != ' ') {
        lecNoList.add(number.text);
      }
      lecNoList2.add(number.text);
    }
    var day1 = lecNoList2.getRange(0, 8);
    for (var i in day1) {
      if (i != ' ') {
        day1Lec.add(i);
      }
    }

    var day2 = lecNoList2.getRange(8, 16);
    for (var i in day2) {
      if (i != ' ') {
        day2Lec.add(i);
      }
    }
    var day3 = lecNoList2.getRange(16, 24);
    for (var i in day3) {
      if (i != ' ') {
        day3Lec.add(i);
      }
    }
    var day4 = lecNoList2.getRange(24, 32);
    for (var i in day4) {
      if (i != ' ') {
        day4Lec.add(i);
      }
    }
    var day5 = lecNoList2.getRange(32, 40);
    for (var i in day5) {
      if (i != ' ') {
        day5Lec.add(i);
      }
    }
    var day6 = lecNoList2.getRange(40, 48);
    for (var i in day6) {
      if (i != ' ') {
        day6Lec.add(i);
      }
    }

    var getLecType = document.getElementsByClassName('type');
    for (var div1 in getLecType) {
      String lecType = div1.text;
      List a = lecType.split(RegExp(r"[0-9]"));
      lecTypeList.add(a.last);
    }

    var getLecCab = document.getElementsByClassName('cab');
    for (var cab in getLecCab) {
      lecCabList.add(cab.text);
    }

    var getLecTime = document.getElementsByClassName('time');
    for (var time in getLecTime) {
      lecTimeList.add(time.text);
    }

    var getLecName = document.getElementsByClassName('name');
    for (var name in getLecName) {
      lecNameList.add(name.text);
    }

    var getTeacherName = document.getElementsByClassName('prep');
    for (var teacherdiv in getTeacherName) {
      var teacherli = teacherdiv.getElementsByTagName('ul');
      for (var teacher in teacherli) {
        teacherNameList.add(teacher.text);
        groupList.add('');
      }
    }
    forday2 = day1Lec.length;
    forday3 = day1Lec.length + day2Lec.length;
    forday4 = day1Lec.length + day2Lec.length + day3Lec.length;
    forday5 = day1Lec.length + day2Lec.length + day3Lec.length + day4Lec.length;
    forday6 = day1Lec.length +
        day2Lec.length +
        day3Lec.length +
        day4Lec.length +
        day5Lec.length;
  }
}
