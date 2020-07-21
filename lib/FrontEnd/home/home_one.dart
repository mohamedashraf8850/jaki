
import 'dart:async';
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jaki_kapten/Component/Drawer_App.dart';
import 'package:jaki_kapten/FrontEnd/account/login.dart';
import 'package:jaki_kapten/FrontEnd/messages/message.dart';
import 'package:jaki_kapten/FrontEnd/messages/notifications.dart';
import 'package:jaki_kapten/services/Models/location.dart';

import 'home_three.dart';


class HomeOnePage extends StatefulWidget {
  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<HomeOnePage> {

  String title = 'تنبيه هام ';
  String subtitle= 'من فضلك قم بالضغط علي هذا التنبة لاستكمال الملف الشخصي وبيانات المركبه لتتمكن من استخدام التطبي  ';

 GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double lat , lng;
  @override
  void initState() {
    getToken().then((l){
      getData(l[1],l[0]);
    });
    getLocation().then((v){
      setState(() {
        lat = v[0];
        lng = v[1];
      });
    });
    super.initState();
  }
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );


      
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
            InkWell(onTap: (){
  Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeThreePage())
              );

            },child: Icon(Icons.swap_horiz,color: Colors.black54,size: 35,)),
            SizedBox(width: 15,),
             Center(child:Image.asset("assets/images/logo2.png",width: 100,)),
             SizedBox(width: 15,),
           InkWell(onTap: (){
              Navigator.push(
              context, MaterialPageRoute(builder: (context) => MessagesPage())
              );
           },  child:Icon(Icons.mail,color: Colors.black54,size: 35,))]),
          leading:
           new IconButton(icon: Icon(Icons.notifications,color: Colors.black54,), 
          onPressed: (){
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => NotificationsPAge())
              );
          },color: Colors.black54,iconSize: 30,)
           
        ),


        body: Container(
          child: Stack(
            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: <Widget>[

              //============================== الجزء الخاص بالخريطة ===
              new Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  // image: DecorationImage(fit: BoxFit.cover,colorFilter: ColorFilter.linearToSrgbGamma(),image: AssetImage("assets/images/map.png"))
                ),
                child: GoogleMap(
                  myLocationEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
              ),



              //============================== الجزء العنوان الذي اسفل AppBar ===
              // Positioned(
              //  bottom: 30,
              //   left: 10,
              //   right: 10,
              //   child: Container(
              //     height: 130,
              //     margin: EdgeInsets.symmetric(horizontal: 10),
              //     padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //         borderRadius: BorderRadius.circular(10)
              //     ),
              //     child: ListTile(
                    
              //       title:Text("$title",textAlign: TextAlign.end,),
              //       subtitle: Text("$subtitle",textAlign: TextAlign.end,style: TextStyle(fontSize: 12)),
              //       trailing: CircleAvatar(backgroundColor: anGrey,maxRadius: 50,child:Image.asset("assets/images/naf.png",scale: 3,),
              //       ),
              //       onTap: (){
              //          Navigator.push(
              // context, MaterialPageRoute(builder: (context) =>MyProfilePage())
              // );
              //       },
              //     )),
                
              // ),



              // //============================== الجزء السفلي  ===
              // Positioned(
              //   bottom: 0,
              //   child: new Container(
              //     width: MediaQuery.of(context).size.width-30,
              //     margin: EdgeInsets.only(bottom: 30),
              //     child: Column(
              //       children: <Widget>[
              //         //============================== جزء السيارة الصغيرة ===
              //         SizedBox(height: 10),
              //         Container(
              //           height: 60,
              //           color: Colors.white,
              //           child: new Row(
              //             children: <Widget>[
              //               Expanded(flex: 4,child: new Text("تنبية هام",style:TextStyle(fontSize: 16),textAlign: TextAlign.center,)),
              //               Expanded(flex: 3,child: Image.asset("assets/images/naf.png",scale: 5,)),
              //             ],
              //           ),
              //         ),


                     


              //       ],
              //     ),
              //   ),
              // ),



            ],
          ),
        ),



    );
  }

  Future getData(driverId , token) async {
   try {
      var url =
          "https://jaki-taxi.com/admin/LatestApi/RestFul/Drivers/ViewDriversDetails.php?DriverID=$driverId&token=$token";
      var request = await http.get(url);
      //print(request.body);
      var data = jsonDecode(request.body);
      print(data);
      // List list = data["inbox"];
      if(data["success"] != 0){
      }
    } catch (e) {
      tostDialog("خطأ في الاتصال تآكد من اتصالك بالانترنت");
    }
  }
 }
