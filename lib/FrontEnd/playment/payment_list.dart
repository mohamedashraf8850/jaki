import 'package:flutter/material.dart';
import 'package:jaki_kapten/ToolsApp/app_Colors.dart';

class PaymentListPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentListPage> {
  @override
Widget build(BuildContext context) {
    return Scaffold(appBar:  
    AppBar(
      title: Center(child:Text("خيارات السحب",style: TextStyle(color: Colors.black),),
    ),
    backgroundColor: anWhite,),
    body: Container()
    );
}}
