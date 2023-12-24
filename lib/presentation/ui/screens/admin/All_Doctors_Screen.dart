import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_hub/presentation/state_holder/Doctor_information_controller.dart';
import 'package:health_hub/presentation/ui/screens/admin/Admin_Dashboard.dart';
import 'package:health_hub/presentation/ui/screens/admin/add_new_doctor_page.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {

  Future<void> _refresh() async {
    // Simulate a network request or any asynchronous operation
    await Future.delayed(Duration(seconds: 2));

    // Update the data
    setState(() {
      Get.find<DoctorInformationController>().getDoctorsData();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              // color: Colors.

            ),
          ),
          leading: InkWell(
            onTap: (){
              Get.offAll(AdminDashBoard());
            },
            child: Row(
              children: [
                SizedBox(width: 5,),
                Icon(Icons.arrow_back_ios),
              ],
            ),
          ),
          leadingWidth: 30,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      // onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: 'Search Doctor',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(Icons.add, color: Colors.white, size: 25),
              ),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CustomTextField(controller: controller, hintText: hintText)

              InkWell(

                onTap:(){Get.offAll(AddNewDoctorPage());},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                  child: Container(

                    height: 80,
                    width: MediaQuery.of(context).size.width*1,
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(height: 15,),
                            Icon(Icons.add,),
                            Text("Add New Doctor",textAlign:TextAlign.center,),
                          ],
                        )),
                  ),
                ),
              ),


              SizedBox(
                height: 550,
                child: GetBuilder<DoctorInformationController>(

                  builder: (controller) {
                    if (controller.doctorList.isEmpty) {
                      return Center(child: CircularProgressIndicator()); // Show a loading indicator while data is being fetched.
                    }
                    else {
                      return RefreshIndicator(
                        onRefresh:_refresh ,
                        child: ListView.builder(
                          itemCount: controller.doctorList.length,
                          itemExtent: 60.0,
                          itemBuilder: (context, index) {
                            final data = controller.doctorList[index];
                            return ListTile(

                              title: Text(data.name,style: TextStyle(color: Colors.white70),),
                              subtitle: Text(data.email,style: TextStyle(color: Colors.white70),),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
