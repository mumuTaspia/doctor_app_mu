import 'dart:convert';

import 'package:doctor_app_mu/DashBoard/DoctorDashBoard.dart';
import 'package:doctor_app_mu/DashBoard/PatientDashBoard.dart';
import 'package:doctor_app_mu/SignUp/PatientsSignUp.dart';
import 'package:doctor_app_mu/SignUp/Registration.dart';
import 'package:doctor_app_mu/SignUp/SpecialistList.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

      String nameKey = "_key_name";
      String type = 'type';
      String loginToken = "loginToken";
      bool _isLoading = false;

  Future<void> saveData(String msg) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(nameKey, msg);
  }

   Future<void> saveType(String msg) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(type, msg);
  }

      Future<void> saveToken(String msg) async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setString(loginToken, msg);
      }
  TextEditingController userName = TextEditingController();
  TextEditingController pass = TextEditingController();
String loginStatus="";

  Future login() async {
var fbtoken;
    _firebaseMessaging.getToken().then((token) {
      fbtoken = token ;//
      print(token);// Print the Token in Console
    });

    setState(() {
      _isLoading = true;
    });
    final response = await http.post("https://doctor-api.appstic.xyz/login",body:{
'user_name': userName.text,
'password' : pass.text,
    });

  

    var data = json.decode(response.body);

    print("login data "+data.toString());
   // print(data['user']['type']);
      setState(() {
      _isLoading = false;
    });
    if(data['status']=='SUCCESS'){
      var userid = data['user']['id'].toString();
  print("Print "+userid);
  await saveData(userid);
var tokenuser = data['access_token'];

await saveToken(tokenuser);

  if(data['user']['type']=="doctor"){
  await saveType("doctor");

  await  updateFbToken(tokenuser,fbtoken);
Navigator.pop(context);
Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DocDashBoard()),
  );
}
else{
  await saveType("patient");
  await  updateFbToken(tokenuser,fbtoken);

  Navigator.pop(context);
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PatientDashBoard()),
  );
}

    }
    else{
      loginStatus = data.toString();
    }

  //  print(data);
  }
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();


 Future updateFbToken(tokenuser,fbtoken) async {

   print("fb token");
print(tokenuser);
    final responce =  await http.post("https://doctor-api.appstic.xyz/updateuser",body: ({
      "access_token": tokenuser,
      "fb_token":fbtoken,

    }));

    var data = json.decode(responce.body);

    print(data);



  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: SingleChildScrollView(
      padding: EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              alignment: Alignment(-1.0, 0.0),
              padding: EdgeInsets.fromLTRB(30, 44, 30, 10),
              child: Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'Eina_regular',
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Container(
            child: Container(
              //color: Colors.white,
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                controller: userName,
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                  labelText: 'Doctor or Patient Username',
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(0),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Container(
              //color: Colors.blueAccent,
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                controller: pass,
                obscureText: true,
                decoration: new InputDecoration(
                  labelText: 'Your password',
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(0),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Center(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          child: _isLoading ? CircularProgressIndicator() : Container(child:Text(loginStatus),),
                                        ),
                                        Container(
                                          //color: Colors.blueAccent,
                                          width: double.infinity,

                                          padding:
                                          EdgeInsets.fromLTRB(
                                              30, 10, 30, 10),
                                          height: 80,
                                          child: RaisedButton(
                                            //padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                            color: Colors.blue,
                                            onPressed: () {
                                              login();


                                            }, //
                                            child: new Text(
                                              "Login",
                                              style: TextStyle(
                                                fontFamily:
                                                'Eina_regular',
                                                fontSize: 14.0,
                                                fontWeight:
                                                FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(top: 10,bottom: 10),
                                            child: GestureDetector(
                                                onTap: (){
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => Registration()),
                                                  );
                                                },
                                                child: Text("Registration",style: TextStyle(fontSize: 22,color: Colors.blue),))),

                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    ),
    );
      
    
  }
}