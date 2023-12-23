
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:health_hub/data/services/CheckPermission.dart';
import 'package:open_file/open_file.dart';

import '../../../data/services/get_directory_path.dart';
import 'package:path/path.dart' as Path;

class ResumeButton extends StatefulWidget {
  final String fileUrl;
  const ResumeButton({super.key,required this.fileUrl});

  @override
  State<ResumeButton> createState() => _ResumeButtonState();
}

class _ResumeButtonState extends State<ResumeButton> {
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




  bool downloading = false;
  bool fileExists = false;
  double progress = 0;
  String fileName = "";
  late String filePath;
  late CancelToken cancelToken;
  var getPathFile = DirectoryPath();

  startDownload() async {
    cancelToken = CancelToken();
    var storePath = await getPathFile.getPath();
    filePath = '$storePath/$fileName';
    setState(() {
      downloading = true;
      progress = 0;
    });

    try {
      await Dio().download(widget.fileUrl, filePath,
          onReceiveProgress: (count, total) {
            setState(() {
              progress = (count / total);
            });
          }, cancelToken: cancelToken);
      setState(() {
        downloading = false;
        fileExists = true;
      });
    }
    catch (e) {
      print(e);
      setState(() {
        downloading = false;
      });
    }
  }

  cancelDownload() {
    cancelToken.cancel();
    setState(() {
      downloading = false;
    });
  }

  checkFileExistance() async {
    var storePath = await getPathFile.getPath();
    filePath = '$storePath/$fileName';
    bool fileExistCheck = await File(filePath).exists();
    setState(() {
      fileExists = fileExistCheck;
    });
  }

  openfile() {
    OpenFile.open(filePath);
    print("fff $filePath");
  }


  @override
  void initState() {
    super.initState();

    setState(() {
      fileName = Path.basename(widget.fileUrl);
    });
    checkFileExistance();
  }




  // @override
  // void initState() {
  //   super.initState();
  //   setState(() {
  //     fileName = Path.basename(widget.fileUrl);
  //   });
  //   checkFileExit();
  // }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor:Colors.grey,
            elevation: 5
        ),
        onPressed: () {
          fileExists && downloading == false
              ? openfile()
              : startDownload();
        },
        child: fileExists?Text("My Resume",style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold))
        :downloading
            ? Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: progress,
              strokeWidth: 3,
              backgroundColor: Colors.grey,
              valueColor: const AlwaysStoppedAnimation<Color>(
                  Colors.blue),
            ),
            Text(
              "${(progress * 100).toStringAsFixed(2)}",
              style: TextStyle(fontSize: 12),
            )
          ],
        ):Text("Download My Resume",style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold))







    );
  }
}
