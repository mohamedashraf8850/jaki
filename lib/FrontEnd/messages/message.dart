

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jaki_kapten/FrontEnd/account/login.dart';
import 'package:jaki_kapten/ToolsApp/app_Colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessagesPage extends StatefulWidget {
  @override
  _AccountTabsPageState createState() => _AccountTabsPageState();
}

class _AccountTabsPageState extends State<MessagesPage> {
  List<String> titles = [];
  List<String> msgs = [];

  @override
  void initState() {
    getToken().then((l){
      _getMessages(l[1],l[0]);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(centerTitle: true,title: Center(child:Text("الرسائل ",
  style: TextStyle(color: Colors.black))),
   leading: InkWell(
    onTap: (){
      Navigator.pop(context);
    },
    child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
  backgroundColor: anWhite,),
  
  body:  Directionality(
      textDirection: TextDirection.rtl,
      child: ListView(children: <Widget>[

     
],)));
  }
  
  Widget cards(name , title){
    return Card(child: ListTile(title: Text("$name"),
       subtitle: Text("$title"),
       leading: CircleAvatar(child: Text("${name[0]}" , style: TextStyle(fontSize:23),),radius: 40,backgroundColor: anGrey,),),
);
  }

  Future _getMessages(driverId , token) async {
   try {
      var url =
          "https://jaki-taxi.com/admin/android/index.php/web_service/GettingAllDriverMessage?driver_id=$driverId";
      var request = await http.get(url);
      //print(request.body);
      var data = jsonDecode(request.body);
      print(data);
      List list = data["inbox"];
      if(data["success"] != 0){
        for (var i = 0; i < list.length; i++) {
          titles.add("${list[i]["title"]}");
          msgs.add("${list[i]["msg"]}");
        }
        setState(() {
          
        });
      }

    } catch (e) {
      tostDialog("خطأ في الاتصال تآكد من اتصالك بالانترنت");
    }
  }

 }
  
  Future getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    print("get prefren token : $token");
    String id = prefs.getString("userid");
    print("get prefren id : $id");
    List<String> l  = [];
    l.add(token);
    l.add(id);
    return l;
   }