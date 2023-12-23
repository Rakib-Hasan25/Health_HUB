import 'package:flutter/material.dart';
import 'package:health_hub/data/services/SendEmail.dart';


class HelpLine extends StatefulWidget {
  const HelpLine({super.key});

  @override
  State<HelpLine> createState() => _HelpLineState();
}

class _HelpLineState extends State<HelpLine> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HelpLine"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

      ),
     body: SingleChildScrollView(
       child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name",style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Enter Your Name'),
              ),
              SizedBox(height: 5,),
              Text("Email",style: TextStyle(fontWeight: FontWeight.bold),),


              SizedBox(height: 10),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Enter your Email'),
              ),
              SizedBox(height: 5,),
              Text("Subject",style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 10),
              TextField(
                controller: _subjectController,
                decoration: InputDecoration(labelText: 'Subject'),
              ),
              SizedBox(height: 5,),
              Text("Description",style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 10),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Write your Description',

                  // contentPadding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                ),
                maxLines: 8,
              ),


              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    SendEmail.sendEmail(name: _nameController.text, email: _emailController.text, subject: _subjectController.text, message: _descriptionController.text);

                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
     ),

    );
  }
}
