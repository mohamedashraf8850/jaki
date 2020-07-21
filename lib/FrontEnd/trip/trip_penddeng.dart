
import 'package:flutter/material.dart';
import 'package:jaki_kapten/Component/shareWedget.dart';
import 'package:jaki_kapten/ToolsApp/app_Colors.dart';

class NextTripPage extends StatefulWidget {
  @override
  _NextTripPageState createState() => _NextTripPageState();
}

class _NextTripPageState extends State<NextTripPage> {

  @override
 Widget build(BuildContext context) {
    return Container(
      color: anGrey,
      child:
    
     ListView(children: <Widget>[

       tripList(ontap:(){
              //      Navigator.push(
              // context, MaterialPageRoute(builder: (context) => DriverRateAboutTripPage())
              // );
       }),
         tripList(ontap:(){
              //      Navigator.push(
              // context, MaterialPageRoute(builder: (context) => DriverRateAboutTripPage())
              // );
       }),
         tripList(ontap:(){
              //      Navigator.push(
              // context, MaterialPageRoute(builder: (context) => DriverRateAboutTripPage())
              // );
       }),
       
                       
    ],));
  }






  

}