import 'package:doctor_app_mu/SignUp/PatientsSignUp.dart';
import 'package:doctor_app_mu/SignUp/SpecialistList.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 200,),
            Container(
                margin: EdgeInsets.only(top: 50,bottom: 10),
                child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SpecilishList()),
                      );
                    },
                    child: Text("Doctor SignUp",style: TextStyle(fontSize: 22,color: Colors.blue),))),
            GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PatientSignUp()),
                  );
                },
                child: Text("Patient SignUp",style: TextStyle(fontSize: 22,color: Colors.blueAccent),)),
          ],),
        ),
      ),
    );
  }
}
