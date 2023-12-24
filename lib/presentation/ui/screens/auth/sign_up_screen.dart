import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_hub/presentation/ui/screens/auth/login_page_as_user.dart';
import 'package:health_hub/presentation/ui/utilis/auth.dart';
import 'package:page_transition/page_transition.dart';

import '../../utilis/sizes.dart';
import '../../utilis/textString.dart';
import '../../widgets/image_assets.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool loading = false;
  List<String> choices = ['Doctor', 'Patient'];
  String _value = "Select Types";
  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                ),
                Image(
                  image: AssetImage(
                    ImageAssets.healthHubLogo,
                  ),
                  width: 250,
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center
                  ,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),


                SizedBox(
                  height: 30,
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

                        style: TextStyle(color:Colors.white),
                        obscureText: true,
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
                      SizedBox(
                        height: Sizes.spaceBtwInputFields,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        style: TextStyle(color:Colors.white),
                        obscureText: true,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.lock,color: Colors.green,),
                            hintText: "Confirm Password",
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
                      SizedBox(
                        height: Sizes.spaceBtwInputFields,
                      ),

                      DropdownButtonFormField(
                        style: TextStyle(color: Colors.grey),
                        dropdownColor: Colors.blueGrey[900],

                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person,color: Colors.green,),
                          hintText: "Select Types",
                          hintStyle: TextStyle(
                            color: Colors.grey
                          ),


                        ),
                          items: [
                            DropdownMenuItem(child: Text("Select Types",style: TextStyle(fontWeight: FontWeight.bold),),value:"Select Types"),
                            DropdownMenuItem(child: Text("Doctor"),value:"Doctor"),
                            DropdownMenuItem(child: Text("User/Patient"),value:"Patient"),
                          ], onChanged: (value){
                          _value = value!;
                          setState(() {
                          });
                      }
                      ),
                      if(_value== "Doctor")
                        Column(
                          children: [
                            const SizedBox(height: Sizes.spaceBtwItems,),
                            TextFormField(
                              controller: _passwordController,
                              style: TextStyle(color:Colors.white),

                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.question_mark,color: Colors.green,),
                                  hintText: "Doctor ID",
                                  hintStyle: TextStyle(color: Colors.grey),
                              ),
                              validator: (String? text) {
                                if (text?.isEmpty ?? true) {
                                  return "Enter Doctor ID";
                                } else if (text!.length <6 && text!.contains("2004")) {
                                  return 'Enter Valid Doctor ID ';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),



                      



                      const SizedBox(
                        height: Sizes.spaceBtwSections,
                      ),
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () => authController.registerUser(_emailController.text, _passwordController.text,_formkey.currentState!.validate()),



                          child: Text("Create"),

                        ),
                      ),


                    ],
                  ),
                ),


                SizedBox(height: 170,),
                GestureDetector(
                  onTap:  ()=> Navigator.push(context,PageTransition(child:LoginPage(), type: PageTransitionType.bottomToTop)),
                  child: RichText(text: TextSpan(
                      text: "Already have an account ?  ",

                      children: [
                        TextSpan(
                            text:"Sign in",
                            style: TextStyle(color: Colors.deepOrange[400])
                        )
                      ]
                  ),),
                )






              ],
            ),
          ),
        ),
      ),
    );;
  }
}
