import 'dart:convert';

import 'package:doctor_app_mu/DashBoard/SignUpThanks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DoctorSignUp extends StatefulWidget {
  String specilistName;
  String specilistID;
  DoctorSignUp({this.specilistName, this.specilistID});
  @override
  _DoctorSignUpState createState() => _DoctorSignUpState();
}

class _DoctorSignUpState extends State<DoctorSignUp> {
  bool _isLoading = false;

  TextEditingController full_name = TextEditingController();
  TextEditingController doc_desc = TextEditingController();
  TextEditingController chamber_address = TextEditingController();
  TextEditingController doc_email = TextEditingController();
  TextEditingController doc_phone = TextEditingController();
  TextEditingController doc_username = TextEditingController();
  TextEditingController doc_pass = TextEditingController();

var data ;
  Future addDoctorData() async {
    setState(() {
      _isLoading = true;
    });

    final responce = await http.post("https://doctor-api.appstic.xyz/signup",
        body: ({
          'user_name': doc_username.text,
          'password': doc_pass.text,
          'phone': doc_phone.text,
          'type': "doctor",
          'full_name': full_name.text,
          'email': doc_email.text,
          'specialist': widget.specilistID,
          'address': chamber_address.text,
          'birthday': "01/01/1995",
          'description': doc_desc.text,
          'status': 'Active',
        }));

    
    data = json.decode(responce.body);
    print(data);
    setState(() {
      _isLoading = false;
    });

if(responce.statusCode==200){
  if(data["status"]=="SUCCESS"){

       Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ThanksSignUp()),
                      );
  }
  else{


  }


}

  }

  Future addDoctor() async {
    setState(() {
      _isLoading = true;
    });

    var postUri = Uri.parse("https://doctor-api.appstic.xyz/signup");
    var request = new http.MultipartRequest("POST", postUri);
    request.fields['user_name'] = doc_username.text;
    request.fields['password'] = doc_pass.text;
    request.fields['phone'] = doc_phone.text;
    request.fields['type'] = "doctor";
    request.fields['full_name'] = full_name.text;
    request.fields['email'] = doc_email.text;
    request.fields['specialist'] = widget.specilistID;
    request.fields['address'] = chamber_address.text;
    request.fields['birthday'] = "01/01/1995";
    request.fields['description'] = doc_desc.text;
    request.fields['status'] = 'Active';

    request
        .send()
        .then((result) async {
          http.Response.fromStream(result).then((response) {
            if (response.statusCode == 200) {
              print("Uploaded! ");
              print('response.body ' + response.body);
              var data = json.decode(response.body);
              var message = data['message'];
              print(message);
            } else {}

            return response.body;
          });
        })
        .catchError((err) => print('error : ' + err.toString()))
        .whenComplete(() {});
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Docotor"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                widget.specilistName,
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: full_name,
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                  labelText: 'Full Name',
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(0),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: doc_desc,
                keyboardType: TextInputType.multiline,
                minLines: null,
                decoration: new InputDecoration(
                  labelText: 'Doctor Description',
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(0),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: chamber_address,
                keyboardType: TextInputType.multiline,
                minLines: null,
                decoration: new InputDecoration(
                  labelText: 'Chamber Address',
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(0),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: doc_email,
                keyboardType: TextInputType.emailAddress,
                minLines: null,
                decoration: new InputDecoration(
                  labelText: 'Doctor Email',
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(0),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: doc_phone,
                keyboardType: TextInputType.phone,
                minLines: null,
                decoration: new InputDecoration(
                  labelText: 'Doctor Phone',
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(0),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: doc_username,
                keyboardType: TextInputType.multiline,
                decoration: new InputDecoration(
                  labelText: 'Doctor Username',
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(0),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: doc_pass,
                obscureText: true,
                decoration: new InputDecoration(
                  labelText: 'Doctor pass',
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(0),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                child: _isLoading ? CircularProgressIndicator() : Container(
                  child: Text(data.toString()),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              RaisedButton(
                  color: Colors.blueAccent,
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    print("Doctor add");
                    // addDoctor();
                    addDoctorData();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
