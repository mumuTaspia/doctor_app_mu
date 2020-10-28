import 'dart:async';
import 'package:doctor_app_mu/DashBoard/DoctorDashBoard.dart';
import 'package:doctor_app_mu/DashBoard/PatientDashBoard.dart';
import 'package:doctor_app_mu/Login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';





class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }


  void navigationPage() {

    print(dataSharePre);
    print("No dada");
    if (dataSharePre==null) {
      Navigator.of(context).pop();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Login()));
    }
    else if (dataSharePre=='doctor'){
      loadData();
      Navigator.of(context).pop();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => DocDashBoard()));
    }
    else if (dataSharePre=='patient'){
      Navigator.of(context).pop();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => PatientDashBoard()));
    }

  }
  String dataSharePre = '';
  String nameKey = "_key_name";
   String type = 'type';
  Future<void> loadShareData() async{
    dataSharePre = await loadData();
  }


  Future<String> loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(type);
  }



  @override
  void initState() {
    super.initState();
    startTime();
    loadShareData();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: new Container(
height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
           // image: DecorationImage(image: new ExactAssetImage('images/complain.jpg'))
        ),
     child: Center(child: Text("Doctor App",style: TextStyle(fontSize: 24,color: Colors.blue),))
      ),
    );
  }
}