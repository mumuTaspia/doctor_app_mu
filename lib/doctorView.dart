import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:doctor_app_mu/Model/doctorModel.dart';
import 'package:doctor_app_mu/Thanks.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorView extends StatefulWidget {
  var docId;
  String name;
  String spName;

  DoctorView({this.name,this.spName,this.docId});
  @override
  _DoctorViewState createState() => _DoctorViewState();
}

class _DoctorViewState extends State<DoctorView> {
  var data;
  bool _isLoading = true;

  bool _isLoadinBook = false;
  String nameKey = "_key_name";
  Future<String> loaddata() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(nameKey);
  }

  Future confirmBook(time) async{
    setState(() {
      _isLoadinBook = true;
    });
    var id =await loaddata();
    print("id "+id);
    final response =await http.post("https://doctor-api.appstic.xyz/createappointment",body: ({
      'doctor_id':widget.docId,
      'patient_id':id,
      'appoint_date':time,
      "status":"Pending",


    }) );



    var data= json.decode(response.body);
    print(data);

    if(response.statusCode==200){
      setState(() {
        _isLoadinBook = false;
      });
      if(data['status']=="SUCCESS"){

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Thanks()),
        );
      }
    }

  }

  Future docData () async {
    final responce = await http.post("https://doctor-api.appstic.xyz/getuser/"+widget.docId.toString());

    setState(() {
      _isLoading = false;
    });

   data  = json.decode(responce.body);
   print(data);

  }


  
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020, 9),
        lastDate: DateTime(2101)
        );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    docData();

    print("init calling");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Your Doctor"),
      ),
      body: SingleChildScrollView(
        child: _isLoading ? Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(child: CircularProgressIndicator())) :  Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:  Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 80,
                width: 80,
                child: Image.network(
                    "https://doctor-api.appstic.xyz/storage/uploads/users/1603376993.png"),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  widget.name,
                  style: TextStyle(fontSize: 24, color: Colors.blue),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                child: Text(widget.spName),
              ),
              Container(
                height: 70,
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      color: Colors.grey[300],
                      height: 70,
                      width: MediaQuery.of(context).size.width / 2 - 1,
                      child: Column(
                        children: [
                          Text("Timing"),
                          Text("4:30 PM -8:30 PM"),
                        ],
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 1,
                      color: Colors.grey,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      color: Colors.grey[300],
                      height: 70,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        children: [
                          Text("Fee"),
                          Text("600/= "),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "About Doctor",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "Docotor Details",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  data[0]["address"],

                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("${selectedDate.toLocal()}".split(' ')[0],style: TextStyle(fontSize: 22),),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('Select date'),
                  ),
                ],
              ),
              Container(
                child: _isLoadinBook ? CircularProgressIndicator() : Container(),
              ),
              RaisedButton(
                color: Colors.blueAccent,
                onPressed: () {
                  String formattedDate = DateFormat('yyyy-MM-dd hh:mm:ss').format(selectedDate);
                  print(formattedDate);
                  confirmBook(formattedDate);

                },
                child: Text("BOOK AN APPOINTMENT"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
