
import 'package:doctor_app_mu/Model/doctorModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ThanksSignUp extends StatefulWidget {
  @override
  _ThanksState createState() => _ThanksState();
}

class _ThanksState extends State<ThanksSignUp> {

  List<DoctorModel> doctorList = List();




  @override
  void initState() {
    // TODO: implement initState
   // getDocList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        margin: EdgeInsets.only(top: 200),
        height: double.infinity,
        width:  double.infinity,
        child: Column(
          children: [
            Center(
              child: Text("Thanks",style: TextStyle(fontSize: 22),),
            ),Center(
    child: Text("Your SignUp Complete",style: TextStyle(fontSize: 22),),
    ),

            RaisedButton(onPressed: (){
              Navigator.pop(context);

          
       
            },
              child: Text("Back to Main Page"),
            )
          ],
        ),
      ),
    );
  }
}
