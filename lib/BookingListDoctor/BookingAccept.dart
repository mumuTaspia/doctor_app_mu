import 'dart:convert';

import 'package:doctor_app_mu/BookingListDoctor/DoctorAcceptList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class BookingAccept extends StatefulWidget {
  String bookid;
  String patientId;
  BookingAccept({this.bookid,this.patientId});
  @override
  _BookingAcceptState createState() => _BookingAcceptState();
}

class _BookingAcceptState extends State<BookingAccept> {
var updateResponce;
   Future updateStatus(String status) async{
     print(widget.bookid);
     setState(() {
       _isloadingAccept = true;
     });
    final responce = await http.post("http://doctor-api.appstic.xyz/updateappointment/"+widget.bookid,body: ({

      'status':status,

    }));

    updateResponce = json.decode(responce.body);

    print(data);

     setState(() {
       _isloadingAccept = false;
     });
  

       
  Navigator.pop(context);
    Navigator.pop(context);
       Navigator.push(
         context,
       MaterialPageRoute(builder: (context) =>  DoctorAcceptList()));
    
                      
  }

  var data;
  bool _isLoading = true;
  bool _isloadingAccept = false;

  getPatientData() async{
    print(widget.patientId);
final responce = await http.post('https://doctor-api.appstic.xyz/getuser/'+widget.patientId);
 data = json.decode(responce.body);
 print(data);
setState(() {
  _isLoading = false;
});

  }

  @override
  void initState() {
    // TODO: implement initState
     getPatientData() ;
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Booking Accept"),),
      body: SingleChildScrollView(
        child: _isLoading ? CircularProgressIndicator() : Container(
          height: MediaQuery.of(context).size.height,
          width:   MediaQuery.of(context).size.width,
      child:  Column(children: [
       
        Container(
          height: 100,
          width: 100,
         // child: Image.network("https://doctor-api.appstic.xyz/storage/uploads/users/"+data[0]['image'])
         ),
        Text("Name : "+ data[0]['full_name']),
        Text("Phone : "+data[0]['phone']),
        Text("Booking Date"),
        Text("Address : "+data[0]['address']),
        Container(
          child: _isloadingAccept ? CircularProgressIndicator():Container(),
        ),
                         Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [

                     RaisedButton(
                       color: Colors.red,
                       child:Text("Cencel",style:TextStyle(color: Colors.white)),
                       onPressed: (){
updateStatus("Cancel");

                       }),
                        RaisedButton(
                       color: Colors.blue,
                       child:Text("Accept",style:TextStyle(color: Colors.white),),
                       onPressed: (){
                         updateStatus("Accept");
                       }),
                   ],)
      ],)
        ),
      ),
     
    );
  }
}