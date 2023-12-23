
import 'package:flutter/material.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  double value = 32;
  final double min = 0;
  final double max = 48;

  bool gender_check = true;
  bool age_check = true;



  int value_weight = 32;
  final int weight_min = 20;
  final int weight_max = 150;


   double BMI = 22;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text("BMI Calculator"),
    leading: IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {
    Navigator.of(context).pop();
    },
    ),
        ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50,),
          Text("Gender",style: TextStyle(fontSize: 20,color: Colors.grey),),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(
              width: 90
              ,child: OutlinedButton(

                onPressed: (){
                  gender_check = true;
                  setState(() {

                  });


            }, child: Text("Male",style: TextStyle(color:gender_check? Colors.red:Colors.grey ),))),
            SizedBox(width: 10,),
            SizedBox(
                width: 90
                ,child: OutlinedButton(onPressed: (){
              gender_check = false;
              setState(() {
              });

            }, child: Text(
                "Female",style: TextStyle(color:gender_check? Colors.grey:Colors.red )))),


          ],
          ),
          SizedBox(height: 10,),
          Text("Age",style: TextStyle(fontSize: 20,color: Colors.grey),),
          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 90
                  ,child: OutlinedButton(onPressed: (){
                age_check = false;
                setState(() {
                });
              }, child: Text("Adult",style: TextStyle(color:age_check? Colors.grey:Colors.red )))),
              SizedBox(width: 10,),
              SizedBox(
                  width: 90
                  ,child: OutlinedButton(onPressed: (){

                age_check = false;
                setState(() {
                });



              }, child: Text(
                  "Children",style: TextStyle(color:age_check? Colors.red:Colors.grey )))),


            ],
          ),
          SizedBox(height: 20,),

          // Slider(
          //     value: value,
          //     max: 48,
          //     min: 0,
          //     onChanged: (value)=>setState(() =>
          //       this.value = value
          //     )),

          Text("How tall are you ?",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),
           SizedBox(height: 5,),
           SliderTheme(

             data: SliderThemeData(

               trackHeight: 9,
               thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13),
               activeTickMarkColor: Colors.green.shade400,
               thumbColor: Colors.red.shade200,
               valueIndicatorColor: Colors.grey,

               activeTrackColor: Colors.green,
              inactiveTrackColor: Colors.grey,

               inactiveTickMarkColor: Colors.transparent
             ),
             child: Row(
               children: [
                 SizedBox(width: 8,),
                 Text("${min.toInt()~/12+3}feet",style: TextStyle(color: Colors.grey,fontSize: 15),),
                 Expanded(
                   child: SizedBox(
                     width: 500,
                     child: Slider(
                          value: value,
                          min: min,
                          divisions: 48,
                          max: max,
                          label: labelHeight(value),
                          onChanged: (value) => setState(() => this.value = value)),
                   ),
                 ),
                 Text("${max.toInt()~/12+3}feet",style: TextStyle(color: Colors.grey,fontSize: 15),),
                 SizedBox(width: 8,),
               ],
             ),
           ),
          SizedBox(height: 5,),
          Text("How much weight do you have ?",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),
          SizedBox(height: 5,),
          SliderTheme(

            data: SliderThemeData(

                trackHeight: 9,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13),
                activeTickMarkColor: Colors.green.shade400,
                thumbColor: Colors.red.shade200,
                valueIndicatorColor: Colors.grey,

                activeTrackColor: Colors.green,
                inactiveTrackColor: Colors.grey,

                inactiveTickMarkColor: Colors.transparent
            ),
            child: Row(
              children: [
                SizedBox(width: 8,),
                Text("${weight_min}kg",style: TextStyle(color: Colors.grey,fontSize: 15),),
                Expanded(
                  child: SizedBox(
                    width: 500,
                    child: Slider(
                        value: value_weight.toDouble(),
                        min: weight_min.toDouble(),
                        divisions: 130,
                        max: weight_max.toDouble(),
                        label: value_weight.toString(),
                        onChanged: (value) => setState(() => this.value_weight = value.toInt())),
                  ),
                ),
                Text("${weight_max}kg",style: TextStyle(color: Colors.grey,fontSize: 15),),
                SizedBox(width: 8,),


              ],
            ),
          ),
          SizedBox(width: 8,),
          SizedBox(width:250,height:50,child: OutlinedButton(onPressed: (){

            double height ;
            int v = value.toInt();
            print(value.toInt());
            int v1 = (v/12).floor();
            if(v%12==0){
              int s =( 3 + v1);

              height = s * 0.305;

            }
            else{

              int s = (3 + v1 );
              int s2 = (v%12);
              height = s*0.305 + s2*0.0254;
            }

            BMI = value_weight/(height*height);
            setState(() {

            });





          }, child: Text("Calculate BMI"))),
          SizedBox(height: 25,),
          Text("Your BMI is",style: TextStyle(color: Colors.grey,fontSize: 18),),
          SizedBox(height: 10,),


          Text("${BMI.toInt()}",style: TextStyle(color: Colors.grey,fontSize: 30)),


          // if(BMI<18.5){
          //   Text("$BMI",style: TextStyle(color: Colors.grey,fontSize: 30))
          // }else{
          //   Text("$BMI",style: TextStyle(color: Colors.grey,fontSize: 30))
          //
          // }
          SizedBox(height: 10,),

          Statement(BMI),










        ],
      ),
    );
  }
  
  String labelHeight(double value){

    int v = value.toInt();
    int v1 = (v/12).floor();
    if(v%12==0){
      int s =( 3 + v1);
      String k = "$s Feet";
      return k;
    } 
    else{

      int s = (3 + v1 );
      int s2 = (v%12);
      String k = "${s}Feet${s2}inch";
      return k;
    }
  }
  
}


Widget Statement(double value){
  String s;

  if(value<18.5){
    s = " underweight";
  }
  else if(value>=18.5&& value<=24.9){
    s = " Healthy";
  }
  else if(value>=25&& value<=29.9){
    s = " overWeight";
  }
  else{
    s = "obese";
  }

  return Text(s,style: TextStyle(fontWeight:FontWeight.bold,color: Colors.grey,fontSize: 30),);
}

