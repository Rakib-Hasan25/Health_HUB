

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_hub/data/services/CheckPermission.dart';
import 'package:health_hub/presentation/ui/screens/user/flutter_web_view.dart';
import 'package:health_hub/presentation/ui/widgets/Resume_button.dart';
import 'package:health_hub/presentation/ui/widgets/image_assets.dart';
import 'package:open_file/open_file.dart';


class DeveloperScreen extends StatefulWidget {
  const DeveloperScreen({super.key});

  @override
  State<DeveloperScreen> createState() => _DeveloperScreenState();
}

class _DeveloperScreenState extends State<DeveloperScreen> {





  bool isPermission = false;
  var checkAllPermissions = CheckPermission();

  checkPermission() async {
    var permission = await checkAllPermissions.isStoragePermission();
    if (permission) {
      setState(() {
        isPermission = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkPermission();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.transparent,
            child: Stack(
              children: [
                Positioned(
                  left: 20,
                  top: 20,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Image.asset(ImageAssets.developerImage),
                  ),
                ),
                DraggableScrollableSheet(
                  initialChildSize:
                      0.5, // Initial height percentage of the sheet
                  minChildSize: 0.5, // Minimum height percentage of the sheet
                  maxChildSize: 0.9, // Maximum height percentage of the sheet
                  builder: (context, scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.blueGrey.withOpacity(1),
                            Colors.black.withOpacity(0.5),
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            Icon(Icons.arrow_drop_up),

                            SizedBox(height: 20),
                            Text("Rakib Hasan",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 35)),
                            SizedBox(height: 5),
                            Text("Flutter Developer",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                            SizedBox(height: 20,),
                            ResumeButton(fileUrl: "https://drive.google.com/file/d/141_AHUH-b85EsacKZzEAm-D11c9-U3Yd/view?usp=sharing",),

                            SizedBox(height: 30,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(WebviewScreen(
                                        link:
                                            "https://github.com/Rakib-Hasan25"));
                                  },
                                  child: SizedBox(
                                    height: 35,
                                    child: Image.asset(ImageAssets.github),
                                  ),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                                InkWell(
                                  onTap: () {
                                    Get.to(WebviewScreen(
                                        link:
                                        "https://www.linkedin.com/in/rakib-hasan-8485b8281/"));
                                  },
                                  child: SizedBox(
                                    height: 35,
                                    child: Image.asset(ImageAssets.linkedin),
                                  ),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                                InkWell(
                                  onTap: () {
                                    Get.to(WebviewScreen(
                                        link:
                                        "https://www.facebook.com/rakib.mdrakibhasan.35/"));
                                  },
                                  child: SizedBox(
                                    height: 35,
                                    child: Image.asset(ImageAssets.facebook),
                                  ),
                                ),
                              ],
                            )

                            // Add more content if needed
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }



  // Future openFile({required String url,String? fileName})async{
  //
  //   final name = fileName ?? url.split('/').last;// jodi ami manually file name provide kori oita nibe or amar url er last part ta nibhe file hisaabe
  //
  //
  //   final file=  await downloadFile(url,name);
  //    if(file == null) return;
  //    print('path: ${file.path}');
  //
  //    OpenFile.open(file.path);// openFile pachage er maddome ami amar file ta ke open korci
  //   print("success");
  //
  //
  // }
  //
  //
  // Future<File?>downloadFile(String url, String name)async{
  //
  //       final appStorage = await getApplicationDocumentsDirectory();// we get a storage  to store our file
  //       final file = File('/${appStorage.path}/$name');// oi storage tar path
  //
  //       try {
  //         final response = await Dio().get(
  //           url,
  //           options: Options(
  //             responseType: ResponseType.bytes,
  //             followRedirects: false,
  //
  //           ),
  //
  //         );
  //         final raf = file.openSync(mode: FileMode
  //             .write); // jei file path ta ache oita te response data ta write koreci
  //         raf.writeFromSync(response.data);
  //         await raf.close();
  //
  //         return file;
  //       }
  //       catch(e){
  //         return null;
  //       }
  //
  // }

}
