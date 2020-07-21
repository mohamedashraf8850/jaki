import 'package:flutter/material.dart';

import 'package:jaki_kapten/Component/shareWedget.dart';
import 'package:jaki_kapten/FrontEnd/account/tabregister.dart';
import 'package:jaki_kapten/ToolsApp/app_Colors.dart';


class UserProfileType extends StatefulWidget {
  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<UserProfileType> {
  TextEditingController phone = new TextEditingController();

  void functionLogin() {
    print('login');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: anGrey,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        height: 50,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text("اواجه صعوبة بالتسجيل ", style: TextStyle(fontSize: 16)),
            new Image.asset(
              "assets/images/icone.png",
              width: 40,
            )
          ],
        ),
      ),
      body: Container(
        height: 400,
        // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 70),
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: anGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child:Card(child: Column(

          children: <Widget>[
            

           Text("تسجيل حساب ك ",style: TextStyle(fontSize: 22,color: anRed,),textAlign: TextAlign.left,),
            SizedBox(height: 25),
            my_Button(
                horizontal: 10,
                textButton: "كابتن ",
                onBtnclicked: () {
                   Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisterTabsPage())
              );
                },
                colorButton: anRed,
                fontSize: 16,
                heightButton: 60,
                radiusButton: 10),
                SizedBox(height: 30),
            my_Button(
                horizontal: 10,
                textButton: "سائق نقل",
                onBtnclicked: () {
               Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisterTabsPage())
              );
                },
                colorButton: anRed,
                fontSize: 16,
                heightButton: 60,
                radiusButton: 10),
                SizedBox(height: 30),
            my_Button(
                horizontal: 10,
                textButton: "وايتات مياة",
                onBtnclicked: () {
               Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisterTabsPage())
              );
                },
                colorButton: anRed,
                fontSize: 16,
                heightButton: 60,
                radiusButton: 10),
                SizedBox(height: 5),
          ],
        )),
      ),
    );
  }
}
