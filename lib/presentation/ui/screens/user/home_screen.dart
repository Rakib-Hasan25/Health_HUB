import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_hub/presentation/ui/screens/auth/login_page_as_user.dart';
import 'package:health_hub/presentation/ui/screens/user/developer_screen.dart';
import 'package:health_hub/presentation/ui/screens/user/helpline_page.dart';
import 'package:health_hub/presentation/ui/utilis/textString.dart';
import 'package:health_hub/presentation/ui/widgets/carousel_slider.dart';
import 'package:health_hub/presentation/ui/widgets/feature_card.dart';
import 'package:health_hub/presentation/ui/widgets/image_assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        drawer: Drawer(
          backgroundColor: Colors.blueGrey[900],
          child: Column(
            children: [
              Container(
                  height: 230,
                  decoration: BoxDecoration(color: Colors.green.shade800),
                  child: Container(
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: 40,
                            left: 90,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 60,
                            ))
                      ],
                    ),
                  )),
              Container(
                height: 460,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.home_filled,
                        size: 27,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Home",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                      onTap: (){
                        Get.to(HomeScreen());
                      },
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.person,
                        size: 27,
                        color: Colors.white,
                      ),
                      title: Text(
                        "My Profile",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.date_range_sharp,
                        size: 27,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Appointment",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      // height:4 ,
                      thickness: 2,
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(HelpLine());
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.headphones,
                          size: 27,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Helpline",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                    InkWell(
                      onTap: ()=>Get.to(DeveloperScreen()),
                      child: ListTile(
                        leading: Icon(
                          Icons.question_mark,
                          size: 27,
                          color: Colors.white,
                        ),
                        title: Text(
                          "About Developer",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                    ListTile(
                      onTap:(){
                       Get.offAll(LoginPage());
                       Get.snackbar("Logout", "You have successfully Logged outed");
                      }
                      ,
                      leading: Icon(
                        Icons.logout,
                        size: 27,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Logout",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                // Container(
                //   color: Colors.white,
                //   height: 200,
                // ),

                HomeSlider(sliderData: ImageAssets.homeSliderImages,),

                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.green.shade100,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: ImageAssets.categoryIconUrl.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 13),
                            child: Container(
                              // height: 85,
                              width: 50,
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.green.shade800,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(ImageAssets
                                          .categoryIconUrl[index]),
                                    ),
                                  ),
                                  // SizedBox(height: 3,),
                                  Container(
                                    width: 60,
                                    height: 18,
                                    decoration: BoxDecoration(
                                        color: Colors.green.shade800,
                                        borderRadius:
                                            BorderRadius.circular(2)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3, vertical: 2),
                                      child: Text(
                                        TString.categoryList[index],
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Text(
                    "Top Features",
                    style: TextStyle(fontSize: 25, color: Colors.red),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 400,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 9,
                              crossAxisSpacing: 9),

                      itemCount: ImageAssets.iconUrl.length ?? 0,
                      // scrollDirection: Axis.vertical,

                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 180,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: FeatureCard(
                            text: TString.featureList[index],
                            iconUrl: ImageAssets.iconUrl[index],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
