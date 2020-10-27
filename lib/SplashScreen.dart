

import 'package:doctor_app_mu/Login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    //  FlutterStatusbarcolor.dar(false);

    return Scaffold(
      backgroundColor: Color(0xffFFC700),
      body: Center(
        child: Container(
        child: Text("Doctor Booking"),
        ),
      ),
    );
  }
}
