import 'package:flutter/material.dart';
import 'package:jaki_kapten/ToolsApp/app_Colors.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
   bool isSwitched = false;
  @override
Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child:Scaffold(  
    
    body: ListView(children: <Widget>[
      Container(
        margin: EdgeInsets.all(10),
         padding: EdgeInsets.all(10),
        color: anWhite,
        height: MediaQuery.of(context).size.height/4+50 ,
      child:Column(children: <Widget>[

        CircleAvatar(radius: 50,
        backgroundColor: anRed,
        ),
        Text("اصدار 1.0"),
        Center(child:Text("نبذه عن التطبيق تكتب هنا نبذه عن التطبيق تكتب هنا     "))
      ],)),

      SizedBox(height: 20,),
      Container(height: MediaQuery.of(context).size.height/2,
      child: Column(children: <Widget>[
        info("تقييم التطبيق",Icon(Icons.star)),
         info("دعوة صديق لتقييم التطبيق  ",Icon(Icons.send)),
          info("ابلاغ عن مشكلة ",Icon(Icons.bug_report)),
          

      ],),)
    ],)
    ));
}

Widget info(String lable,Icon icon){
  return Container(
  
     decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: anGrey),
          ),
            color: anWhite,
        ),
  child: ListTile(title: Text(lable,style: TextStyle(fontSize: 14),),
  leading: icon,
  )
  
  
  );
}
}
