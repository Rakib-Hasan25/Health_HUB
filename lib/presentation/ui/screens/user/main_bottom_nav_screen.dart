
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_hub/presentation/state_holder/all_doctor_data_controller.dart';
import 'package:health_hub/presentation/state_holder/department_data_controller.dart';
import 'package:health_hub/presentation/ui/screens/user/home_screen.dart';
import 'package:health_hub/presentation/ui/utilis/color_palette.dart';

import '../../../state_holder/main_bottom_nav_controller.dart';
class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),





    // CatagoryListScreen(),
    // CartScreen(),
    // WishListScreen(),
  ];



  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
       Get.find<AllDoctorDataController>().getDoctorsData();
       Get.find<DepartmentDataController>().getDepartmentData();
    });
    super.initState();
  }





  @override
  Widget build(BuildContext context) {


    return GetBuilder<MainBottomNavController>(
        builder: (controller) {
      return Scaffold(
        body: _screens[controller.currentSelectedIndex??0],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blueGrey[900] ,
          currentIndex: controller.currentSelectedIndex??0,
          onTap: controller.changeScreen,
          selectedItemColor: ColorPalette.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          // showSelectedLabels: true,
          elevation: 4,

          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.border_color), label: 'Book Appointment'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notification_add), label: 'My Appointment'),

          ],
        ),
      );
    });
  }
}