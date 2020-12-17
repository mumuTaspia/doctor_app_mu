import 'dart:convert';

import 'package:doctor_app_mu/BookingListDoctor/BookingAccept.dart';
import 'package:doctor_app_mu/BookingListDoctor/BookingComplete.dart';
import 'package:doctor_app_mu/DashBoard/DoctorDrawer.dart';
import 'package:doctor_app_mu/Model/BookingListModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CancelDoctorListPatient extends StatefulWidget {
  @override
  _BookingListByDoctorState createState() => _BookingListByDoctorState();
}

class _BookingListByDoctorState extends State<CancelDoctorListPatient> {

  List<BookingModel> bookingList = List();

  bool _isLoading = true ;


  String nameKey = "_key_name";

  Future<String> loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(nameKey);
  }
  Future getBookingList() async {
    String userid = await loadData() ;
    print(userid);
    final responce = await http.post("https://doctor-api.appstic.xyz/appointmentbystatusdoctor/cancelbydoctor/"+userid);

    setState(() {
      _isLoading = false;
    });
    var data = json.decode(responce.body);

    print(data);

    for(var note  in data){
      bookingList.add(BookingModel.fromJson(note));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBookingList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DoctorDrawer(),
      appBar: AppBar(title: Text("Cancel By Doctor List"),),
      body: _isLoading ? Container(
          height:MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(child: CircularProgressIndicator())) : Container(
        height: MediaQuery.of(context).size.height,
        width:    MediaQuery.of(context).size.width,
        child: bookingList.length ==0 ? Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(child: Text("No Cancel Data")),) : ListView.builder(
            itemCount: bookingList.length,
            itemBuilder: (BuildContext context, int index){
              String formattedDate = DateFormat('yyyy-MMM-dd ').format(bookingList[index].appointDate);
              //     print(formattedDate);
              return  Container(
                margin: EdgeInsets.all(10),
                // padding: EdgeInsets.all(10),
                child: Card(
                  elevation: 4,
                  child: Column(children: [
                    Text("id : "+bookingList[index].id.toString()),

                    Text("Serial : "+(bookingList[index].serial == null ? "0" :bookingList[index].serial.toString())),
                    Text("Appoint Time : "+formattedDate),
                    Text(bookingList[index].status.toString()),
                    RaisedButton(
                        color: Colors.blue,
                        child:Text("Next >>",style:TextStyle(color: Colors.white)),
                        onPressed: (){

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BookingComplete(patientId: bookingList[index].patientId.toString(),bookid: bookingList[index].id.toString(),)),
                          );
                        }),



                  ],),
                ),
              );
            }),
      ),
    );
  }
}
