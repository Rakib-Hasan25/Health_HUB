import 'package:flutter/material.dart';
import 'package:health_hub/presentation/ui/widgets/doctor_catagory_Card.dart';
import 'package:health_hub/presentation/ui/widgets/image_assets.dart';

import '../../utilis/textString.dart';

class DoctorCatagory extends StatefulWidget {
  const DoctorCatagory({super.key});

  @override
  State<DoctorCatagory> createState() => _DoctorCatagoryState();
}

class _DoctorCatagoryState extends State<DoctorCatagory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],

        appBar: AppBar(

          title: Text("Doctor Specialities",style: TextStyle(color: Colors.white),),
        ),

        // Center(
        //   child: GetBuilder<AllDoctorDataController>(
        //     builder: (controller) {
        //       if (controller.doctorList.isEmpty) {
        //         return const CircularProgressIndicator(); // Show a loading indicator while data is being fetched.
        //       } else {
        //         return ListView.builder(
        //           itemCount: controller.doctorList.length,
        //           itemBuilder: (context, index) {
        //             final data = controller.doctorList[index];
        //             return ListTile(
        //               title: Text(data.name),
        //               subtitle: Text(data.email),
        //             );
        //           },
        //         );
        //       }
        //     },
        //   ),
        // )
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12,right:12,top: 18),
            child: SizedBox(
              height: MediaQuery.of(context).size.height*0.83,
              child: GridView.builder(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 9),

                itemCount: ImageAssets.iconUrl.length ?? 0,
                scrollDirection: Axis.vertical,

                itemBuilder: (BuildContext context, int index) {
                  return DoctorCategoryCard(
                    text: TString.featureList[index],
                    iconUrl: ImageAssets.iconUrl[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),


    );
  }
}
