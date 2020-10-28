import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class DoctorEdit extends StatefulWidget {
  @override
  _DoctorEditState createState() => _DoctorEditState();
}

class _DoctorEditState extends State<DoctorEdit> {

Future getProfileData() async{
 final responce = await http.post("url");

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}