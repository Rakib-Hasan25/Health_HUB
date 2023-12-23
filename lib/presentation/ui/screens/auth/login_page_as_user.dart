import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_hub/presentation/state_holder/auth_controller.dart';
import 'package:health_hub/presentation/ui/screens/auth/sign_up_screen.dart';
import 'package:health_hub/presentation/ui/screens/user/home_screen.dart';
import 'package:health_hub/presentation/ui/screens/user/main_bottom_nav_screen.dart';
import 'package:health_hub/presentation/ui/utilis/auth.dart';
import 'package:health_hub/presentation/ui/utilis/sizes.dart';
import 'package:health_hub/presentation/ui/utilis/textString.dart';
import 'package:health_hub/presentation/ui/widgets/image_assets.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool loading = false;
  final _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                Image(
                  image: AssetImage(
                    ImageAssets.healthHubLogo,
                  ),
                  width: 200,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      TString.welcomeBack,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Revolutionzing Hospital Management with\nintelligent Solution,",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        //validation er bepar ase tai
                        controller: _emailController,
                        style: TextStyle(color:Colors.white),
                        decoration: const InputDecoration(

                            prefixIcon: Icon(Icons.email_outlined,color: Colors.green,),
                            hintText: TString.email,
                          hintStyle: TextStyle(color: Colors.grey)

                        ),
                        validator: (String? text) {
                          if (text?.isEmpty ?? true) {
                            return "Enter Email Address";
                          } else if (text!.isEmail == false) {
                            return 'Enter a Valid Email Adress';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: Sizes.spaceBtwInputFields,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        style: TextStyle(color:Colors.white),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.lock,color: Colors.green,),

                            hintText: TString.password,
                            hintStyle: TextStyle(color: Colors.grey),
                            suffixIcon: Icon(Icons.remove_red_eye_rounded,color: Colors.green)),
                        validator: (String? text) {
                          if (text?.isEmpty ?? true) {
                            return "Enter Password";
                          } else if (text!.length < 6) {
                            return 'password more than 6 character ';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(
                        height: Sizes.spaceBtwSections,
                      ),
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: OutlinedButton(

                          onPressed: () =>authController.loginUser(_emailController.text,_passwordController.text,_formkey.currentState!.validate()),
                          child: Text("Login"),

                        ),
                      ),
                      SizedBox(height: 8,),
                      TextButton(
                        onPressed: () {

                        }, child: Text(TString.forgetPassword,
                        style: TextStyle(fontSize: 15,color: Colors.deepOrange[400]),),),


                    ],
                  ),
                ),
                
                
                SizedBox(height: 220,),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: ()=> Navigator.push(context,PageTransition(child: SignUpScreen(), type: PageTransitionType.bottomToTop)),
                    child: RichText(text: TextSpan(
                      text: "Don't have an account yet?  ",

                      children: [
                        TextSpan(
                          text:"Sign up",

                          style: TextStyle(color: Colors.deepOrange[400])
                        )
                      ]
                    ),),
                  ),
                )






              ],
            ),
          ),
        ),
      ),
    );
  }
}
