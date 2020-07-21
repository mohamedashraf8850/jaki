import 'package:flutter/material.dart';
import 'package:jaki_kapten/ToolsApp/app_Colors.dart';

class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
   bool isSwitched = false;
  @override
Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child:Scaffold(appBar:  
    AppBar(
      elevation: 0,
      title: Center(child:Text("الملف الشخصي ",style: TextStyle(color: Colors.black),),
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
      Column(children: <Widget>[
        info(Text("لميا زغلول "),"الاسم بالكامل ",Icon(Icons.person)),
         info(Text("٩٩٩٩٩٩٩٩٩٩"),"رقم الجوال  ",Icon(Icons.person)),
          info(Text("llll@llll.com"),"البريد الالكتروني ",Icon(Icons.person)),
           info(Text(" "),"تغيير كلمه المرور ",Icon(Icons.person)),
          SizedBox(height: 30,),
          info(Text(" "),"سياره صغيره",Icon(Icons.local_taxi)),
          SizedBox(height: 30,),
           info(
              Text('م س ي٣٢٣')
        ,"رقم اللوحة  ",Icon(Icons.keyboard)),

        InkWell(child:Container(
          width: 200,
          padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(10),
        color: anRed,
        child: Center(child:Text("حفظ",style: TextStyle(color: anWhite),)),))

      ],),
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
