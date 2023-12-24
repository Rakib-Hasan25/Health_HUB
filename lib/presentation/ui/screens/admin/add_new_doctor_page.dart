import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_hub/presentation/state_holder/Doctor_information_controller.dart';
import 'package:health_hub/presentation/ui/screens/admin/All_Doctors_Screen.dart';
import 'package:health_hub/presentation/ui/widgets/custom_texfield.dart';

class AddNewDoctorPage extends StatefulWidget {
  const AddNewDoctorPage({super.key});

  @override
  State<AddNewDoctorPage> createState() => _AddNewDoctorPageState();
}

class _AddNewDoctorPageState extends State<AddNewDoctorPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController departmentIdController = TextEditingController();
  List<String> choices = ['Doctor', 'Patient'];
  String _value = "Select Types";




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Get.offAll(DoctorDetails());
            },
            child: Icon(Icons.arrow_back)),
        title: Text("Add New Doctor infomation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Doctor Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              SizedBox(height: 10,),

              CustomTextField(controller: nameController, hintText: "Doctor name"),

              SizedBox(height: 10,),
              Text("Doctor email",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              SizedBox(height: 10,),

              CustomTextField(controller: emailController, hintText: "Doctor email"),
              SizedBox(height: 10,),
              Text("Doctor Degree",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              SizedBox(height: 10,),
              CustomTextField(controller: degreeController, hintText: "Doctor Degree",maxLines: 5,),
              SizedBox(height: 10,),
              Text("Department",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              SizedBox(height: 10,),
              DropdownButtonFormField(
                  style: TextStyle(color: Colors.grey),
                  dropdownColor: Colors.blueGrey[900],

                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person,color: Colors.green,),
                    hintText: "Select department",
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),


                  ),
                  items: [
                    DropdownMenuItem(child: Text("Select Department",style: TextStyle(fontWeight: FontWeight.bold),),value:"Select Types"),
                    DropdownMenuItem(child: Text("eye"),value:"eye"),
                    DropdownMenuItem(child: Text("heart"),value:"heart"),
                    DropdownMenuItem(child: Text("cardiologists"),value:"cardiologists"),

                  ], onChanged: (value){
                    _value = DoctorInformationController.SelectedDepartment(value!)!;
                    setState(() {
                      print(_value);
                    });
              }
              ),

              SizedBox(height: 20,),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(onPressed: (){
                    Get.find<DoctorInformationController>().uploadDoctorData(nameController!.text,emailController!.text,degreeController!.text,_value!);
                  }, child: Text("Submit"))),



            ],
          ),
        ),
      ),
    );
  }
}
