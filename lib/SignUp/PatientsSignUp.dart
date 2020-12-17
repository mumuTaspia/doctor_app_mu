import 'dart:convert';

import 'package:doctor_app_mu/DashBoard/SignUpThanks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class PatientSignUp extends StatefulWidget {
  String specilistName;
  String specilistID ;
  
 // DoctorSPatientSignUpignUp({this.specilistName,this.specilistID});
  @override
  _DoctorSignUpState createState() => _DoctorSignUpState();
}

class _DoctorSignUpState extends State<PatientSignUp> {
bool _isLoading = false;

 TextEditingController full_name = TextEditingController();
  TextEditingController doc_desc = TextEditingController();
   TextEditingController chamber_address = TextEditingController();
  TextEditingController doc_email = TextEditingController();
   TextEditingController doc_phone = TextEditingController();
  TextEditingController doc_username = TextEditingController();
   TextEditingController doc_pass = TextEditingController();


var data ;
  Future addPatientData() async {
    setState(() {
      _isLoading = true;
    });

    final responce = await http.post("https://doctor-api.appstic.xyz/signup",
        body: ({
          'user_name': doc_username.text,
          'password': doc_pass.text,
          'phone': doc_phone.text,
          'type': "patient",
          'full_name': full_name.text,
          'email': doc_email.text,
        //  'specialist': widget.specilistID,
          'address': chamber_address.text,
          'birthday': "01/01/1995",
          'description': doc_desc.text,
          'status': 'Inactive',
        }));

    
   var data2 = json.decode(responce.body);
    print(data2);
    setState(() {
      _isLoading = false;
    });

if(responce.statusCode==200){
  if(data2["status"]=="SUCCESS"){

    data = data2["message"];
       Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ThanksSignUp()),
                      );
  }
  else{


  }


}

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Patient"),),
     body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              
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
                  labelText: 'Patient Description',
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
                  labelText: ' Address',
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
                  labelText: 'Patient Email',
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
                  labelText: 'Patient Phone',
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
                  labelText: 'Patient Username',
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
                  labelText: 'Patient pass',
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
                  child: Text(data == null ? "" : data.toString()),
                ),
              ),
            
              SizedBox(
                height: 8,
              ),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text("SIGN UP",style: TextStyle(color: Colors.white),),
                onPressed: (){
                  if(doc_phone.text.length ==  11){

                  //  print(doc_phone.text.substring(0,2)=="01");

                    if(doc_phone.text.substring(0,2) == "01"){
                      addPatientData();
                    }
                    else{
                      data = "Phone Number invalid";
                    }
                  }
                  else{
                    data = "Phone Number invalid";
                  }

                  setState(() {

                  });


              }),
            
            ],
          ),
        ),
      ),
  
    );
  
  }
}