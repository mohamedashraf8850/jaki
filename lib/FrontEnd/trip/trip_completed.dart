
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jaki_kapten/Component/shareWedget.dart';
import 'package:jaki_kapten/FrontEnd/account/login.dart';
import 'package:jaki_kapten/ToolsApp/app_Colors.dart';

class HoistryTripPage extends StatefulWidget {
  @override
  _HoistryTripPageState createState() => _HoistryTripPageState();
}

class _HoistryTripPageState extends State<HoistryTripPage> {
  @override
Widget build(BuildContext context) {
    return Container(
      color: anGrey,
      child:
    
     ListView(children: <Widget>[

      tripList(
      ontap:(){
       }),
                       
    ],));
  }
   
  Future _getArrivedTrips(driverId , token) async {
   try {
      var url =
          "https://jaki-taxi.com/admin/android/index.php/web_service/GettingAllDriverMessage?driver_id=$driverId&token=$token";
      var request = await http.get(url);
      //print(request.body);
      var data = jsonDecode(request.body);
      print(data);
      List list = data["inbox"];
      if(data["success"] != 0){
        for (var i = 0; i < list.length; i++) {
          
        }
        setState(() {
          
        });
      }

    } catch (e) {
      tostDialog("خطأ في الاتصال تآكد من اتصالك بالانترنت");
    }
  }

 }

