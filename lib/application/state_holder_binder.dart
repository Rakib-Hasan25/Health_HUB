

import 'package:get/get.dart';
import 'package:health_hub/presentation/state_holder/all_doctor_data_controller.dart';
import 'package:health_hub/presentation/state_holder/auth_controller.dart';
import 'package:health_hub/presentation/state_holder/department_data_controller.dart';
import 'package:health_hub/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:health_hub/presentation/state_holder/splash_screen_controller.dart';

class StateHolderBinder extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SplashScreenController());
    Get.put(MainBottomNavController());
    Get.put(AuthController());
    Get.put(AllDoctorDataController());
    Get.put(DepartmentDataController());



  }

}