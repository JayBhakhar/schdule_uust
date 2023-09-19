import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:schedule_uust/views/pages/Home_Screen/home_binding.dart';
import 'package:schedule_uust/views/pages/Home_Screen/home_view.dart';
import 'package:schedule_uust/views/pages/Schedule/schedule_binding.dart';
import 'package:schedule_uust/views/pages/Schedule/schedule_view.dart';

GetStorage box = GetStorage();

List<GetPage> getPagesList = [
  GetPage(name: "/home", page: () => HomeView(), binding: HomeBinding()),
  GetPage(
      name: "/schedule",
      page: () => ScheduleView(),
      binding: ScheduleBinding()),
];