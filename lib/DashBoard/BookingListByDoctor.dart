import 'dart:convert';

import 'package:doctor_app_mu/Model/BookingListModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class BookingListByDoctor extends StatefulWidget {
  @override
  _BookingListByDoctorState createState() => _BookingListByDoctorState();
}

class _BookingListByDoctorState extends State<BookingListByDoctor> {
  
  List<BookingModel> bookingList = List();
  
  
  Future getBookingList() async {
    final responce = await http.post("https://doctor-api.appstic.xyz//appointmetnsbydoctor/1");
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:    MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index)=>(
             Container()
            )),
      ),
    );
  }
}
