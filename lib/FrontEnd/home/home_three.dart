
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:jaki_kapten/Component/Drawer_App.dart';
import 'package:jaki_kapten/FrontEnd/account/login.dart';
import 'package:jaki_kapten/FrontEnd/messages/message.dart';
import 'package:jaki_kapten/ToolsApp/app_Colors.dart';


class HomeThreePage extends StatefulWidget {
  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<HomeThreePage> {

  

  String title = 'تنبيه هام ';
  String subtitle= 'من فضلك قم بالضغط علي هذا التنبة لاستكمال الملف الشخصي وبيانات المركبه لتتمكن من استخدام التطبي  ';

 GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    getToken().then((l){
      _changeStateOn(l[1],l[0]);
    });
    super.initState();
  }

  @override
  void dispose() {
    getToken().then((l){
      _changeStateOff(l[1],l[0]);
    });
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
       key: _scaffoldKey,
    endDrawer: MyDrawer(),
        appBar: AppBar(
          elevation: 0,
          actions: <Widget>[
           IconButton(
    icon: Icon(Icons.menu,color: Colors.black54,),
    onPressed: (){
      _scaffoldKey.currentState.openEndDrawer();
    },
   ),
          ],
         
          backgroundColor: Colors.white,
          title:Row(children: <Widget>[
            SizedBox(width: 25,),
            Icon(Icons.swap_horiz,color: Colors.black54,size: 35,),
            SizedBox(width: 15,),
             Center(child:Image.asset("assets/images/logo2.png",width: 100,)),
             SizedBox(width: 15,),
             Icon(Icons.mail,color: Colors.black54,size: 35,)]),
          leading:
           new IconButton(icon: Icon(Icons.notifications,color: Colors.black54,), 
          onPressed: (){},color: Colors.black54,iconSize: 30,)
           
        ),


        body:ListView(children: <Widget>[ Container(
      child: new Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      
                         new Container(
                height: MediaQuery.of(context).size.height - 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(fit: BoxFit.cover,colorFilter: ColorFilter.linearToSrgbGamma(),image: AssetImage("assets/images/map.png"))
                ),
              ),  
                         
                      Positioned(
                          bottom: -90,
                          left: 1,
                          right: 1,
                          child: AvatarGlow(
                            glowColor: Colors.blue,
                            endRadius: 90.0,
                            duration: Duration(milliseconds: 2000),
                            repeatPauseDuration: Duration(milliseconds: 100),
                            child: Material(
                              elevation: 2,
                              shape: CircleBorder(),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey[100],
                                radius: 55.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(55),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('assets/images/user.png'
                                              ))),
                                ),
                              ),
                            ),
                          )),
                    ],
                  )),
                  SizedBox(height: 70,),
Row(
   mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
 Column(children: <Widget>[
    CircleAvatar(backgroundColor: anGrey,maxRadius: 40,
    child:Image.asset("assets/images/rate.png",scale: 3,)),
    Text("15"),
    Text("تقييم")
    ],),
 SizedBox(width: 10,),
  Column(children: <Widget>[
    CircleAvatar(backgroundColor: anGrey,maxRadius: 40,
    child:Image.asset("assets/images/cost.png",scale: 12,)),
    Text("500 ر.س"),
    Text("اجمالي الارباح")
    ],),
    SizedBox(width: 10,),
 Column(children: <Widget>[
    CircleAvatar(backgroundColor: anGrey,maxRadius: 40,
    child:Image.asset("assets/images/money.png",scale: 10,)),
    Text("500 ر.س"),
    Text("ارباح اليوم")
    ],),
    SizedBox(width: 10,),
  Column(children: <Widget>[
    CircleAvatar(backgroundColor: anGrey,maxRadius: 40,
    child:Image.asset("assets/images/trip.png",scale: 12,)),
    Text("10"),
    Text("رحلات اليوم")

    ],),
    ],)

],)

    );
  }
  Future _changeStateOn(driverId , token) async {
   try {
      var url =
          "http://jaki-taxi.com/admin/LatestApi/RestFul/TransportationDrivers/UpdateDriverStatus.php?driver_id=$driverId&token=$token&Status=1";
      var request = await http.get(url);
      //print(request.body);
      var data = jsonDecode(request.body);
      print(data);
      if(data["success"] != 0){
        setState(() {
          
        });
      }

    } catch (e) {
      tostDialog("خطأ في الاتصال تآكد من اتصالك بالانترنت");
    }
  }
  Future _changeStateOff(driverId , token) async {
   try {
      var url =
          "http://jaki-taxi.com/admin/LatestApi/RestFul/TransportationDrivers/UpdateDriverStatus.php?driver_id=$driverId&token=$token&Status=0";
      var request = await http.get(url);
      //print(request.body);
      var data = jsonDecode(request.body);
      print(data);
      if(data["success"] != 0){
        setState(() {
          
        });
      }

    } catch (e) {
      tostDialog("خطأ في الاتصال تآكد من اتصالك بالانترنت");
    }
  }
}
