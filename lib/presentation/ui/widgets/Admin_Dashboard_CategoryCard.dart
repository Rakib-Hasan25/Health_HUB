import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_hub/presentation/ui/screens/admin/All_Doctors_Screen.dart';
import 'package:health_hub/presentation/ui/screens/auth/login_page_as_user.dart';

class AdminDashBoardCategoryCard extends StatefulWidget {
  final String text;
  final String iconUrl;
  const AdminDashBoardCategoryCard({super.key,required this.text,required this.iconUrl});

  @override
  State<AdminDashBoardCategoryCard> createState() => _AdminDashBoardCategoryCardState();
}

class _AdminDashBoardCategoryCardState extends State<AdminDashBoardCategoryCard> {
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){

        if(widget.text=="All Doctors"){
          Get.to(DoctorDetails());
        }
        else if(widget.text=="All Patient"){
          // Get.to(DoctorCatagory());
        }
        else if(widget.text=="All Department"){
          // Get.to(DoctorCatagory());
        }
        else if(widget.text=="All Appointment Details"){
          // Get.to(DoctorCatagory());
        }
        else if(widget.text=="All Payment Details"){
          // Get.to(DoctorCatagory());
        }
        else if(widget.text=="Logout"){
          Get.offAll(LoginPage());
          Get.snackbar("Logout", "You have successfully Logged out");
        }


      },
      child: Padding(padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(height: 2,),
            SizedBox(height:100,child: Image.asset(widget.iconUrl,fit:BoxFit.fitHeight ,)),
            SizedBox(height: 4,),
            Text(widget.text,style: TextStyle(fontSize:15 ,fontWeight: FontWeight.bold),),


          ],
        ),

      ),
    );


  }
}