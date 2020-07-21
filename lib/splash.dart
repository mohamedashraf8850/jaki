 
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jaki_kapten/FrontEnd/home/home_one.dart';
import 'FrontEnd/sliders/intro_man.dart';

class Splash extends StatefulWidget {
  final int havedata;
  Splash({this.havedata});
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
   @override
  void initState() {
    super.initState();
     setState(() {
      loadData();
    });
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }
   onDoneLoading() async {
     if(widget.havedata != 1){
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => MainPage()));
     }
     else{
       Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomeOnePage()));
     }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
        ),
        child:Center(child: Image.asset('assets/images/logo.png',height: 150,),)
    );
  }
}