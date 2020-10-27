
import 'package:doctor_app_mu/DashBoard/PatientDrawer.dart';
import 'package:doctor_app_mu/DoctorsList.dart';
import 'package:doctor_app_mu/consts.dart';
import 'package:doctor_app_mu/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
class PatientDashBoard extends StatefulWidget {
  @override
  _DocDashBoardState createState() => _DocDashBoardState();
}

class _DocDashBoardState extends State<PatientDashBoard> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: PatientDrawer(),
      appBar: AppBar(title: Text("DashBoard"),),
      body: SingleChildScrollView(
        child: new Container(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  padding: EdgeInsets.only(top: 25),
                ),
                Container(
                  padding: EdgeInsets.only(top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      CustomAppBarWidget(),
                      SizedBox(
                        height: 55,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(

                            child: Container(
                              height: 150,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                border: Border.all(color: Colors.white),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(1, 1),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                              //margin: EdgeInsets.symmetric(horizontal: 5),
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(height: 5),
                                          Align(
                                            alignment: AlignmentDirectional.center,
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage('images/orthopedics.png')
                                                ),
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Align(
                                            alignment: AlignmentDirectional.center,
                                            child: Text(
                                              "Orthopedics",
                                              style: TextStyle(
                                                color: '#1E2661'.toColor(),
                                                fontSize: 18,
                                                height: 1.5,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DoctorsList(spID: '1',spName: "Orthopedics",)),
                              );
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              height: 150,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                border: Border.all(color: Colors.white),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(1, 1),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                              //margin: EdgeInsets.symmetric(horizontal: 5),
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(height: 5),
                                          Align(
                                            alignment: AlignmentDirectional.center,
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                             decoration: BoxDecoration(
                                               image: DecorationImage(
                                                   image: AssetImage('images/pills.png')
                                               ),
                                               borderRadius: BorderRadius.all(Radius.circular(8)),
                                             ),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Align(
                                            alignment: AlignmentDirectional.center,
                                            child: Text(
                                              "Medicine",
                                              style: TextStyle(
                                                color: '#1E2661'.toColor(),
                                                fontSize: 18,
                                                height: 1.5,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DoctorsList(spID: '2',spName: "Medicine",)),
                              );
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              height: 150,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                border: Border.all(color: Colors.white),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(1, 1),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                              //margin: EdgeInsets.symmetric(horizontal: 5),
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(height: 5),
                                          Align(
                                            alignment: AlignmentDirectional.center,
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                             decoration: BoxDecoration(
                                               image: DecorationImage(
                                                   image: AssetImage('images/gyne.png')
                                               ),
                                               borderRadius: BorderRadius.all(Radius.circular(8)),
                                             ),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Align(
                                            alignment: AlignmentDirectional.center,
                                            child: Text(
                                              "Gynecology",
                                              style: TextStyle(
                                                color: '#1E2661'.toColor(),
                                                fontSize: 18,
                                                height: 1.5,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DoctorsList(spName: 'Gynecology',spID: '3',)),
                              );
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              height: 150,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                border: Border.all(color: Colors.white),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(1, 1),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                              //margin: EdgeInsets.symmetric(horizontal: 5),
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(height: 5),
                                          Align(
                                            alignment: AlignmentDirectional.center,
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                             decoration: BoxDecoration(
                                               image: DecorationImage(
                                                   image: AssetImage('images/neorology.png')
                                               ),
                                               borderRadius: BorderRadius.all(Radius.circular(8)),
                                             ),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Align(
                                            alignment: AlignmentDirectional.center,
                                            child: Text(
                                              "Neorology",
                                              style: TextStyle(
                                                color: '#1E2661'.toColor(),
                                                fontSize: 18,
                                                height: 1.5,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DoctorsList(spID: "4",spName: "Neorology",)),
                              );
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              height: 150,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                border: Border.all(color: Colors.white),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(1, 1),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                              //margin: EdgeInsets.symmetric(horizontal: 5),
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(height: 5),
                                          Align(
                                            alignment: AlignmentDirectional.center,
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                             decoration: BoxDecoration(
                                               image: DecorationImage(
                                                   image: AssetImage('images/heart.png')
                                               ),
                                               borderRadius: BorderRadius.all(Radius.circular(8)),
                                             ),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Align(
                                            alignment: AlignmentDirectional.center,
                                            child: Text(
                                              "Cardiac",
                                              style: TextStyle(
                                                color: '#1E2661'.toColor(),
                                                fontSize: 18,
                                                height: 1.5,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DoctorsList(spName: "Cardiac",spID: "5",)),
                              );
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              height: 150,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                border: Border.all(color: Colors.white),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(1, 1),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                              //margin: EdgeInsets.symmetric(horizontal: 5),
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(height: 5),
                                          Align(
                                            alignment: AlignmentDirectional.center,
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                             decoration: BoxDecoration(
                                               image: DecorationImage(
                                                   image: AssetImage('images/ent.png')
                                               ),
                                               borderRadius: BorderRadius.all(Radius.circular(8)),
                                             ),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Align(
                                            alignment: AlignmentDirectional.center,
                                            child: Text(
                                              "Ent",
                                              style: TextStyle(
                                                color: '#1E2661'.toColor(),
                                                fontSize: 18,
                                                height: 1.5,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DoctorsList(spID: "6",spName: "Ent",)),
                              );
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                    ],
                  ),
                ),
              ],
            )
        ),
        //backgroundColor: AppColors.backgroundColor,

      ),
    );
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}