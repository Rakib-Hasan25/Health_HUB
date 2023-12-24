
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_hub/application/state_holder_binder.dart';
import 'package:health_hub/presentation/ui/screens/admin/Admin_Dashboard.dart';
import 'package:health_hub/presentation/ui/screens/splash_screen.dart';
import 'package:health_hub/presentation/ui/screens/user/home_screen.dart';
import 'package:health_hub/presentation/ui/screens/user/main_bottom_nav_screen.dart';

import '../presentation/ui/utilis/color_palette.dart';

class HealthHub extends StatefulWidget {
  const HealthHub({super.key});
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  @override
  State<HealthHub> createState() => _HealthHubState();
}

class _HealthHubState extends State<HealthHub> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: HealthHub.globalKey,
      debugShowCheckedModeBanner:  false,
      initialBinding: StateHolderBinder(),
      // home: SplashScreen(),
      home:AdminDashBoard(),
      theme: ThemeData(

           primarySwatch: MaterialColor(
            ColorPalette.primaryColor.value, ColorPalette().color),
          appBarTheme: AppBarTheme(
            // color: Color.fromARGB(10, 75, 12, 100)
            // color: Colors.green
            color: Colors.green.shade800

          ),

          textTheme: TextTheme(bodyText1:Theme.of(context).textTheme.bodyText1?.copyWith(
              color: MaterialColor(ColorPalette.primaryColor.value, ColorPalette().color)) ),


          // elevatedButtonTheme: ElevatedButtonThemeData(
          //     style: ElevatedButton.styleFrom(
          //         padding: EdgeInsets.symmetric(vertical: 12),
          //         textStyle:  const TextStyle(
          //             fontSize: 14,
          //             letterSpacing: 0.5,
          //             fontWeight: FontWeight.w400),
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(15)))),


          outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  textStyle:  const TextStyle(
                      fontSize: 18,
                      letterSpacing: 0.5,
                      color: Colors.green,
                      fontWeight: FontWeight.w600),
                  side: BorderSide(color:Colors.green,width: 2),

                  shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(30)))),



          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            border:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 2.0)),
            enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 2.0)),
            disabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 2.0)),
          )

      ),
      themeMode: ThemeMode.light,
    );
  }
}