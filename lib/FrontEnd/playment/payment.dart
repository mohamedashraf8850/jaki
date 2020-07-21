

import 'package:flutter/material.dart';
import 'package:jaki_kapten/Component/shareWedget.dart';
import 'package:jaki_kapten/FrontEnd/playment/payment_list.dart';
import 'package:jaki_kapten/ToolsApp/app_Colors.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
Widget build(BuildContext context) {
    return Scaffold(appBar:  
    AppBar(
      title: Center(child:Text("المحفظة",style: TextStyle(color: Colors.black),),
    ),
     leading: InkWell(
    onTap: (){
      Navigator.pop(context);
    },
    child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
    backgroundColor: anWhite,),
    body: Container(
      color: anGrey,
      child:
    
     ListView(children: <Widget>[

     Card(child: Column(children: <Widget>[
       SizedBox(height: 10,),
       Container(
         child: CircleAvatar(backgroundColor: anGrey,maxRadius: 50,
    child:Image.asset("assets/images/cost.png",scale: 8,)),
       ),
       Row(
            mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[


Container(
  width: MediaQuery.of(context).size.width/3-10,
  child: 
         Column(children: <Widget>[
         Container(child:Text("الرصيد الكلي",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
          Container(child:Text("500 SAR",style: TextStyle(color: Colors.green))),
          Container(child:Text("كامل الرصيد الموجود ف حسابك يتضمن الربح والرصيد المعلق ",style: TextStyle(fontSize: 12))),
         ],)),
      Container(
  width: MediaQuery.of(context).size.width/3-10,
  child: 
         Column(children: <Widget>[
         Container(child:Text("الرصيد الكلي",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
          Container(child:Text("500 SAR",style: TextStyle(color: Colors.green))),
          Container(child:Text("كامل الرصيد الموجود ف حسابك يتضمن الربح والرصيد المعلق ",style: TextStyle(fontSize: 12),)),
         ],)),
       Container(
  width: MediaQuery.of(context).size.width/3-10,
  child: 
         Column(children: <Widget>[
         Container(child:Text("الرصيد الكلي",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
          Container(child:Text("500 SAR",style: TextStyle(color: Colors.green))),
          Container(child:Text("كامل الرصيد الموجود ف حسابك يتضمن الربح والرصيد المعلق ",style: TextStyle(fontSize: 12))),
         ],)),
       ],),
       SizedBox(height: 20,),

     ],),
     
       
     
     ),

     Card(

       child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
         children: <Widget>[
       Text("سحب الارباح ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
       SizedBox(height: 5,),
         Text("المبلغ المطلوب سحبة ",style: TextStyle(fontSize: 16),),
           Text("SAR ادخل المبلغ ",style: TextStyle(fontSize: 16),),
           Divider(),
            my_Button(
                horizontal: 80,
                textButton: "سحب",
                onBtnclicked: () {

                  Navigator.push(
              context, MaterialPageRoute(builder: (context) =>PaymentListPage())
              );
                },
                colorButton: Colors.green,
                fontSize: 16,
                heightButton: 60,
                radiusButton: 2),
                SizedBox(height: 15,),

     ],),),
   Directionality(
      textDirection: TextDirection.rtl,
      child:  Card(child:Column(
         mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
       Text("المعاملات المالية",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
       Divider(),
     
       ListTile(title: Text("تحقيق ارباح من رحله #6"),
       subtitle: Text("20/20/2020"),
       leading: CircleAvatar(child: Text("36SRA"),radius: 40,backgroundColor: anGrey,),),
         Divider(),
        ListTile(title: Text("تحقيق ارباح من رحله #6"),
       subtitle: Text("20/20/2020"),
       leading: CircleAvatar(child: Text("36SRA"),radius: 40,backgroundColor: anGrey,),),
       Divider(),
        ListTile(title: Text("تحقيق ارباح من رحله #6"),
       subtitle: Text("20/20/2020"),
       leading: CircleAvatar(child: Text("36SRA"),radius: 40,backgroundColor: anGrey,),)
     ],))  )                
    ],)));
  }
   

}