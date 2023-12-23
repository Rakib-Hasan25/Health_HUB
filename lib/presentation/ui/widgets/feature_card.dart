import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_hub/presentation/ui/screens/user/bmi_calculator_screen.dart';
import 'package:health_hub/presentation/ui/screens/user/doctor_catagory.dart';


class FeatureCard extends StatefulWidget {
  final String text;
  final String iconUrl;
  const FeatureCard({super.key,required this.text,required this.iconUrl});

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        if(widget.text=="BMI Calculator"){
          Get.to(BmiCalculatorScreen());
        }
        else if(widget.text=="Find Doctor"){
          Get.to(DoctorCatagory());
        }


      },
      child: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(15),
        child: Column(
            children: [
              // const SizedBox(height: 2,),
              SizedBox(height:70,child: Image.asset(widget.iconUrl,fit:BoxFit.fitHeight ,)),
              Text(widget.text,style: TextStyle(fontSize: 11),),


          ],
        ),

        ),
      ),
    );


  }
}
