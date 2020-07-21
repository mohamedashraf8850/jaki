import 'package:flutter/material.dart';
import 'package:jaki_kapten/ToolsApp/app_Colors.dart';

class SettingsPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<SettingsPage> {
   bool isSwitched = false;
  @override
Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child:Scaffold(appBar:  
    AppBar(
      elevation: 0,
      title: Center(child:Text("الاعدادات",style: TextStyle(color: Colors.black),),
    ),
    backgroundColor: anWhite,
    leading: InkWell(child: Icon(Icons.arrow_back,color: Colors.black,),
    onTap: (){
      Navigator.of(context).pop();
    },),),
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
        Text("Lamia zaghloul"),
        Text("+11432544344")
      ],)),

      SizedBox(height: 20,),
      Container(height: MediaQuery.of(context).size.height/2,
      child: Column(children: <Widget>[
        info(Text("لميا زغلول "),"الاسم بالكامل ",Icon(Icons.person)),
         info(Text("٩٩٩٩٩٩٩٩٩٩"),"رقم الجوال  ",Icon(Icons.person)),
          info(Text("llll@llll.com"),"البريد الالكتروني ",Icon(Icons.person)),
           info(Text(" "),"تغيير كلمه المرور ",Icon(Icons.person)),
          SizedBox(height: 30,),
           info(
              Switch(
          value: isSwitched,
          onChanged: (value){
            setState(() {
              // isSwitched=value;
              // print(isSwitched);
            });
          },
          activeTrackColor: Colors.lightGreenAccent,
          activeColor: Colors.green,
        )
        ,"النتبهات  ",Icon(Icons.person)),

      ],),)
    ],)
    ));
}

Widget info(Widget title,String lable,Icon icon){
  return Container(
  
     decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: anGrey),
          ),
            color: anWhite,
        ),
  child: ListTile(title: Text(lable),
  leading: icon,
  trailing:  title
  )
  
  
  );
}
}
