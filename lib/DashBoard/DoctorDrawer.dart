
import 'package:doctor_app_mu/BookingListDoctor/CancelByDoctor.dart';
import 'package:doctor_app_mu/BookingListDoctor/DocPendingList.dart';
import 'package:doctor_app_mu/BookingListDoctor/DoctorAcceptList.dart';
import 'package:doctor_app_mu/BookingListDoctor/DoctorCompleteList.dart';
import 'package:doctor_app_mu/EditProfile.dart';

import 'package:doctor_app_mu/Login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorDrawer extends StatelessWidget {
  Widget customText(String txt) {
    return Text(
      txt,
      style: TextStyle(color: Color(0xff666666), fontSize: 16),
    );
  }
  String id = "_key_name";
   String type = 'type';
  //String accesskey = "access_token";
  // String userId = "user_id";

  Future<void> removeData(BuildContext context) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    await sharedPreference.remove(id);
    await sharedPreference.remove(type);


    Navigator.pop(context);
    Navigator.pop(context);


    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
          child: Container(
            // color: Color(0xffFCF9F5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),

                Container(
                  height: 45,
                  child: ListTile(
                    contentPadding:
                    EdgeInsets.only(bottom: 0.0, left: 15.0, right: 14.0,top: 0),
                    title: customText('My profile'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15.0,
                    ),
                    onTap: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => EditProfile()),
                       );
                    },
                  ),
                ),
                Container(
                  height: 45,
                  child: ListTile(
                    contentPadding: EdgeInsets.only(top: 0.0, left: 15.0, right: 14.0,bottom: 0),
                    title: customText('Patients New Bookings'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15.0,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DoctorPendingList(),),
                       );
                    },
                  ),
                ),

                  Container(
                  height: 45,
                  child: ListTile(
                    contentPadding: EdgeInsets.only(top: 0.0, left: 15.0, right: 14.0,bottom: 0),
                    title: customText('Booking Accept List'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15.0,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DoctorAcceptList(),),
                       );
                    },
                  ),
                ),

                  Container(
                  height: 45,
                  child: ListTile(
                    contentPadding: EdgeInsets.only(top: 0.0, left: 15.0, right: 14.0,bottom: 0),
                    title: customText('Booking Complete list'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15.0,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DoctorCompleteList(),),
                      );
                    },
                  ),
                ),

                Container(
                  height: 45,
                  child: ListTile(
                    contentPadding: EdgeInsets.only(top: 0.0, left: 15.0, right: 14.0,bottom: 0),
                    title: customText('Booking Cancel list'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15.0,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CancelDoctorList(),),
                      );
                    },
                  ),
                ),





                GestureDetector(
                  onTap: () {
                    removeData(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 17,top: 5),
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.exit_to_app),
                        SizedBox(
                          width: 20,
                        ),
                        customText(
                          "Logout",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}