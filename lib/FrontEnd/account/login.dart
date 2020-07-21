import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:jaki_kapten/Component/shareWedget.dart';
import 'package:jaki_kapten/FrontEnd/home/home_one.dart';
import 'package:jaki_kapten/ToolsApp/app_Colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<LoginPage> {
  TextEditingController phone = new TextEditingController();
  TextEditingController pass = new TextEditingController();
 

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
            new Text("لااستطيع الدخول للحساب", style: TextStyle(fontSize: 16)),
            new Image.asset(
              "assets/images/icone.png",
              width: 40,
            )
          ],
        ),
      ),
      body: Container(
        height: 500,
        // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 70),
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: anGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child:Card(child: SingleChildScrollView(
                  child: Column(
            children: <Widget>[
              //------- صورة المستخدم
              new Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/profile2.png")),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),

              SizedBox(height: 5),
              new Text(
                "سجل دخول لاستخدام التطبيق",
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(height: 10),
               new Container(
                          height: 50,
//                      color: Colors.grey,
                          child: new TextField(
                            controller: phone,
                            keyboardType: TextInputType.phone,
                            textAlign: TextAlign.end,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.email),
                              hintText: 'رقم الجوال',
                              
                              hintMaxLines: 1,
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),
                         new Container(
                          height: 50,
//                      color: Colors.grey,
                          child: new TextField(
                            controller: pass,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.end,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.lock_outline),
                              hintText: 'كلمة المرور',
                              hintMaxLines: 1,
                            ),
                          ),
                        ),
              SizedBox(height: 5,),
            Text("هل نسيت كلمة المرور ؟",textAlign: TextAlign.left,),
              SizedBox(height: 15),
              my_Button(
                  horizontal: 10,
                  textButton: "دخول",
                  onBtnclicked: () {
                    if(pass.text.trim() != "" && phone.text.trim() != ""){
                      _makePostLogIn().then((v){
                            if(v == true){
                            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeOnePage())
                );
                          }
                      });
                    }

                //      Navigator.pushReplacement(
                // context, MaterialPageRoute(builder: (context) => HomeOnePage())
                // );
                  },
                  colorButton: anRed,
                  fontSize: 16,
                  heightButton: 60,
                  radiusButton: 10),
                  SizedBox(height: 5),
            ],
          ),
        )),
      ),
    );
  }
 Future _makePostLogIn() async {
   try {
      var url =
          "http://jaki-taxi.com/admin/LatestApi/RestFul/Users/UserLogin.php?Password=${pass.text}&Mobile=${phone.text}";
      var request = await http.get(url);
      //print(request.body);
      var data = jsonDecode(request.body);
      print(data);
      if(data["success"] != 0){
    _saveTok(data["deviceToken"]);
    _saveuserId(data["UserID"]);
    return true;
  }
    } catch (e) {
      tostDialog("خطأ في الاتصال تآكد من اتصالك بالانترنت");
    }
  }

 }
 tostDialog(String message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(0xff222222),
        textColor: Colors.white,
        fontSize: 18.0);
 }

 _saveTok(token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
    print("saved in prefren token : $token");
   }
   _saveuserId(userid) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'userid';
    final value = userid;
    prefs.setString(key, value);
    print("saved in prefren userid : $userid");
   }
