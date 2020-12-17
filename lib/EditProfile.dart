import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  bool _isLoading = true;
  bool _isLoadinUpdate = false;
  String updateStatus = "";
  String nameKey = "_key_name";
  String loginToken = "loginToken";


  Future<String> loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(nameKey);
  }

  Future<String> loadToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(loginToken);
  }

  var updateresponce = "";

  TextEditingController fname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController email = TextEditingController();

  Future getUserData() async{
    String userid = await loadData() ;
    final response = await http.post("https://doctor-api.appstic.xyz/getuser/"+userid);

  var data = json.decode(response.body);
  fname.text= data[0]["full_name"];
  phone.text = data[0]["phone"];
  address.text = data[0]["address"];
    description.text = data[0]["description"];
    email.text = data[0]["email"];
  setState(() {
    _isLoading = false;
  });
  print(data);
  }

  update() async {
setState(() {
  _isLoadinUpdate = true;
});
    var token = await loadToken();
    print(token);
    final responce = await http.post("https://doctor-api.appstic.xyz/updateuser",body: ({
      'access_token':token,
      'phone':phone.text,
'address':address.text,
      'full_name':fname.text,
      'email':email.text,
      'description':description.text,


    }));

    var data = json.decode(responce.body);
    print(data);
    updateresponce = data['message'];
setState(() {
  _isLoadinUpdate = false;
});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile"),),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: _isLoading? Center(child: CircularProgressIndicator()): Column(children: [
           Container(
              //color: Colors.blueAccent,
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                controller: fname,
               // obscureText: true,
                decoration: new InputDecoration(
                  labelText: 'Full Name',
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(0),
                  ),
                ),
              ),
            ),
            Container(
              //color: Colors.blueAccent,
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                controller: phone,
                decoration: new InputDecoration(
                  labelText: 'Phone',
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(0),
                  ),
                ),
              ),
            ),
            Container(
              //color: Colors.blueAccent,
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                controller: email,
                decoration: new InputDecoration(
                  labelText: 'Email',
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(0),
                  ),
                ),
              ),
            ),
            Container(
              //color: Colors.blueAccent,
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                controller: address,
                // obscureText: true,
                decoration: new InputDecoration(
                  labelText: 'Address',
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(0),
                  ),
                ),
              ),
            ),
            Container(
              //color: Colors.blueAccent,
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                controller: description,
                // obscureText: true,
                decoration: new InputDecoration(
                  labelText: 'Description',
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(0),
                  ),
                ),
              ),
            ),

            Container(child:_isLoadinUpdate? CircularProgressIndicator(): Text(updateresponce),),


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
                                            child: _isLoading ? CircularProgressIndicator() : Container(child:Text(updateStatus),),
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
                                              update();


                                              }, //
                                              child: new Text(
                                                "Update",
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

          ],),
        ),
      ),
    );
  }
}