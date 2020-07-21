

import 'package:flutter/material.dart';
import 'package:jaki_kapten/ToolsApp/app_Colors.dart';

class NotificationsPAge extends StatefulWidget {
  @override
  _AccountTabsPageState createState() => _AccountTabsPageState();
}

class _AccountTabsPageState extends State<NotificationsPAge> {
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(centerTitle: true,title: Center(child:Text("التنبيهات ",style: TextStyle(color: Colors.black),)),
  backgroundColor: anWhite,
  leading: InkWell(
    onTap: (){
      Navigator.pop(context);
    },
    child: Icon(Icons.arrow_back_ios,color: Colors.black,),),),
  
  body:  Directionality(
      textDirection: TextDirection.rtl,
      child: ListView(children: <Widget>[
    //  cards("لمياء زغلول", "السلام عليكم ورحمة الله وبركاته"),
    //   cards("خالد بن الوليد", "السلام عليكم ورحمة الله وبركاته")
 

],)));
  }
  Widget cards(name , title){
    return Card(child: ListTile(title: Text("$name"),
       subtitle: Text("$title"),
       leading: CircleAvatar(child: Text("${name[0]}" , style: TextStyle(fontSize:23),),radius: 40,backgroundColor: anGrey,),),
);
  }
  }
