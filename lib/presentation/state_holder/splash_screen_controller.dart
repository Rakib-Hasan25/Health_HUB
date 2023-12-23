import 'package:get/get.dart';
import 'package:health_hub/presentation/ui/dummy_screen.dart';
import 'package:health_hub/presentation/ui/screens/auth/login_page_as_user.dart';

class SplashScreenController extends GetxController{
  RxBool animate = false.obs;
  Future startAnimation()async{
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 5000));
    // Get.to(LoginPage());

  }
}