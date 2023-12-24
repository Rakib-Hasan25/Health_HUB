import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_hub/presentation/ui/utilis/textString.dart';
import 'package:health_hub/presentation/ui/widgets/Admin_Dashboard_CategoryCard.dart';
import 'package:health_hub/presentation/ui/widgets/image_assets.dart';

import '../../../state_holder/Doctor_information_controller.dart';

class AdminDashBoard extends StatefulWidget {
  const AdminDashBoard({super.key});

  @override
  State<AdminDashBoard> createState() => _AdminDashBoardState();
}

class _AdminDashBoardState extends State<AdminDashBoard> {
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<DoctorInformationController>().getDoctorsData();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(
                  height: 40,
                ),
                Image(
                  image: AssetImage(
                    ImageAssets.healthHubLogo,
                  ),
                  width: 200,
                ),
                SizedBox(
                  width: 8,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Admin Dashboard",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 800,
                    child: GridView.builder(
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 15),

                      itemCount: ImageAssets.adminDashboardCategoryImages.length ?? 0,
                      // scrollDirection: Axis.vertical,

                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 180,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child:AdminDashBoardCategoryCard(
                            text: TString.adminDashboardCategoryList[index],
                            iconUrl: ImageAssets.adminDashboardCategoryImages[index],
                          ),
                        );
                      },
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
