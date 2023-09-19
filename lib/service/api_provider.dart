import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as https;
import 'package:schedule_uust/views/pages/Home_Screen/home_controller.dart';
import '../consts/consts.dart';

class ApiProvider extends GetConnect {
  Future<List<dynamic>> getGroupsList() async {
    final HomeController controller = Get.find();
    final response = await get('${apiBaseUrl}faculty=${controller.facultyId}');
    if (response.status.hasError) {
      return Future.error(response.statusText as Object);
    } else {
      List groupsLists = [];
      var document = parse(response.body);
      var ul = document.getElementsByTagName('ul');
      List gruId = [];
      List gruName = [];
      for (var a in ul) {
        List _id = [];
        List _name = [];
        gruId.add(_id);
        gruName.add(_name);
        var id = a.getElementsByTagName('ul div');
        var name = a.getElementsByTagName('ul a');
        for (var _ in id) {
          _id.add(_.innerHtml);
        }
        for (var _ in name) {
          _name.add(_.innerHtml);
        }
        Map grpMap = Map.fromIterables(_id, _name);
        groupsLists.add(grpMap);
      }
      return groupsLists;
    }
  }

  Future<List<dynamic>> getLettersList() async {
    final response = await get('${apiBaseUrl}prepList=1');
    if (response.status.hasError) {
      return Future.error(response.statusText as Object);
    } else {
      List _letter = [];
      List _lettersId = [];
      List lettersMapList = [];
      var document = parse(response.body);
      var letters = document.getElementsByTagName('div');
      for (var letter in letters) {
        var letID = letter.attributes['onclick'];
        var numberletID = letID?.replaceAll(RegExp('[^0-9]'), '');
        _letter.add(letter.text);
        _lettersId.add(numberletID);
      }
      Map letterMap = Map.fromIterables(_lettersId, _letter);
      lettersMapList.add(letterMap);
      return lettersMapList;
    }
  }

  Future<List<dynamic>> getBuildingsList() async {
    final response = await get('${apiBaseUrl}korpuses=1');
    if (response.status.hasError) {
      return Future.error(response.statusText as Object);
    } else {
      List _buildings = [];
      List _buildingsId = [];
      List buildingsMapList = [];
      var document = parse(response.body);
      var rooms = document.getElementsByClassName('prep_name');
      for (var room in rooms) {
        var roomId = room.attributes['onclick'];
        var numberletID = roomId?.replaceAll(RegExp('[^0-9]'), '');
        _buildings.add(room.text);
        _buildingsId.add(numberletID);
      }
      Map buildingsMap = Map.fromIterables(_buildingsId, _buildings);
      buildingsMapList.add(buildingsMap);
      return buildingsMapList;
    }
  }

  Future<List<dynamic>> getTeachersList(String letterId) async {
    final response = await get('${apiBaseUrl}letter=$letterId');
    if (response.status.hasError) {
      return Future.error(response.statusText as Object);
    } else {
      List _teachers = [];
      List _teachersId = [];
      List teachersMapList = [];
      var document = parse(response.body);
      var teacherNames = document.getElementsByClassName('prep_name');
      for (var teacherName in teacherNames) {
        var teaNameIDAttribute = teacherName.attributes['onclick'];
        var teaNameIDstr = teaNameIDAttribute?.replaceAll(RegExp('[^0-9]'), '');
        var teaNameID = teaNameIDstr?.substring(2, teaNameIDstr.length - 1);
        _teachers.add(teacherName.text);
        _teachersId.add(teaNameID);
      }
      Map teachersMap = Map.fromIterables(_teachersId, _teachers);
      teachersMapList.add(teachersMap);
      return teachersMapList;
    }
  }

  Future<List<dynamic>> getRoomsList(String roomId) async {
    final response = await get('${apiBaseUrl}korpus=$roomId');
    if (response.status.hasError) {
      return Future.error(response.statusText as Object);
    } else {
      List _roomsId = [];
      List _roomsList = [];
      List roomsMapList = [];
      var document = parse(response.body);
      var roomNumbers = document.getElementsByClassName('prep_name');
      for (var roomNumber in roomNumbers) {
        var roomNumberIDAttribute = roomNumber.attributes['onclick'];
        var teaNameIDstr =
        roomNumberIDAttribute?.replaceAll(RegExp('[^0-9]'), '');
        var teaNameID = teaNameIDstr?.substring(2, teaNameIDstr.length - 1);
        _roomsList.add(roomNumber.text);
        _roomsId.add(teaNameID);
      }
      Map roomMap = Map.fromIterables(_roomsId, _roomsList);
      roomsMapList.add(roomMap);
      return roomsMapList;
    }
  }

  Future<String> getSchedule(String type, String id, int week) async {
    final _url = Uri.parse('http://edu.strbsu.ru/php/getShedule.php');
    var _json = {'type': type, 'id': id, 'week': '$week'};
    final response = await https.post(_url, body: _json);
    if (response.statusCode == 200) {
      String body = response.body;
      return body;
    } else {
      return Future.error(response.statusCode);
    }
  }
}