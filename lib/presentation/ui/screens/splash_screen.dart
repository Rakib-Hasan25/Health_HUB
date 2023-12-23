
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:health_hub/presentation/state_holder/splash_screen_controller.dart';
import 'package:health_hub/presentation/ui/screens/auth/login_page_as_user.dart';
import 'package:health_hub/presentation/ui/screens/auth/sign_up_screen.dart';
import 'package:health_hub/presentation/ui/widgets/image_assets.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height:  MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        child: Stack(
            children: [
              Container(
                // color: Colors.red,
                width: 450,
                height: 500,
                child: Image(image: AssetImage(ImageAssets.splashScreenEmoji),fit:BoxFit.contain,),
              ),
              Positioned(
                bottom: 0.1,
                child: Container(
                  // color: Colors.red,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                    color: Colors.blueGrey[900]
                    // color: Colors.black
                  ),

                  width: MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.width,
                 // color: Colors.black,
                 child: Column(
                   children: [
                     SizedBox(height: 60,),
                     Image.asset(ImageAssets.healthHubLogo),
                     SizedBox(height: 30,),
                     Text("Welcome",style: TextStyle(fontSize: 30,color:Colors.green[800]),),
                     SizedBox(height: 30,),

                     Text("Powered By",style: TextStyle(fontSize: 12,color:Colors.green[800]),),
                     SizedBox(height: 5,),
                     Text("Rakib Hasan ",style: TextStyle(fontSize: 19,color:Colors.green[800]),),
                     SizedBox(height: 30,),
                     Row(mainAxisAlignment: MainAxisAlignment.center,
                       children: [

                       SizedBox(
                         width: 100,
                         child: ElevatedButton(

                           onPressed: (){
                             Navigator.push(context,PageTransition(child: SignUpScreen(), type: PageTransitionType.bottomToTop));

                           }, child: Text("Signup")

                         ),
                       ),


                       SizedBox(width: 12,),



                       SizedBox(
                           width: 100,

                           child: ElevatedButton(onPressed: (){

                             Navigator.push(context,PageTransition(child: LoginPage(), type: PageTransitionType.bottomToTop));

                           }, child: Text("Signin"))),

                     ],)










                     
                     
                   ],
                 ),
                ),
              ),


              // Expanded(child: Container(
              //   color: Colors.black,
              // ))



            ]
          ),
      ),

    );
  }
}
