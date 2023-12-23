import 'package:flutter/material.dart';

class DoctorCategoryCard extends StatefulWidget {
  final String text;
  final String iconUrl;
  const DoctorCategoryCard({super.key,required this.text,required this.iconUrl});

  @override
  State<DoctorCategoryCard> createState() => _DoctorCategoryCardState();
}

class _DoctorCategoryCardState extends State<DoctorCategoryCard> {
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        if(widget.text=="BMI Calculator"){
          // Get.to(BmiCalculatorScreen());
        }
        else if(widget.text=="Find Doctor"){
          // Get.to(DoctorCatagory());
        }
      },
      child:Column(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundColor: Colors.green.shade400,
              child: Image.asset(widget.iconUrl,
                width: 50,
                height: 50,
                fit:BoxFit.contain ,),
          ),
        SizedBox(
          height: 8,
        ),
          Text(widget.text,style: TextStyle(fontSize: 11,color: Colors.white70),),




        ],
      )

      // SingleChildScrollView(
      //   child: Padding(padding: EdgeInsets.all(15),
      //     child: Column(
      //       children: [
      //         // const SizedBox(height: 2,),
      //         SizedBox(height:70,child: Image.asset(widget.iconUrl,fit:BoxFit.fitHeight ,)),
      //         Text(widget.text,style: TextStyle(fontSize: 11),),
      //
      //
      //       ],
      //     ),
      //
      //   ),
      // ),
    );


  }
}