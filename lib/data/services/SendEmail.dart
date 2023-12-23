import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class SendEmail{



  static Future sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,

  })async{
    final serviceId = 'service_ho2tfhn';
    final templateId = 'template_pkag45e';
    final userId = 'ZDtGXEdG6o50j_NjF';
    final url  = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    try {
      final response = await http.post(
          url,
          headers: {
            'origin': 'http://localhost',
            'Content-Type': 'application/json',
          },
          body: json.encode({
            'service_id': serviceId,
            'template_id': templateId,
            'user_id': userId,
            'template_params': {
              'user_name': name,
              'user_email': email,
              'user_subject': subject,
              'user_message': message,
            }
          }
          )



      );
      Get.snackbar("Success", "email is sent");
    }
    catch(e){
      Get.snackbar("Something is wrong", "email is not sent");
    }

  }
}







