import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:jaki_kapten/Component/shareWedget.dart';
import 'package:jaki_kapten/FrontEnd/account/login.dart';
import 'package:jaki_kapten/FrontEnd/home/home_one.dart';
import 'package:jaki_kapten/ToolsApp/app_Colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<RegisterPage> {

  TextEditingController phone = new TextEditingController();
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController repass = new TextEditingController();

  void functionLogin(){
    print('login');
  }

  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
backgroundColor: anGrey,
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          height: 50,
          color: Colors
          .white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text("لااستطيع الدخول للحساب" , style: TextStyle(fontSize: 16)),
              new Image.asset("assets/images/icone.png",width: 40,)
            ],
          ),
        ),


        body: SingleChildScrollView(
                  child: Column(
            children: <Widget>[
              
              Container(
                height: 540,
                // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 70),
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color:anGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:Card(child: Column(
                  children: <Widget>[


                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: new Row(
                        children: <Widget>[


                          //===========================الاسم الاخير =====
                          Expanded(flex:1,
                            child:new Container(
                            height: 50,
//                      color: Colors.grey,
                              child: new TextField(
                                controller: lastName,
                                keyboardType: TextInputType.text,
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                  suffixIcon:Icon(Icons.supervisor_account),
                                  hintText: 'الاسم الاخير',
                                  hintMaxLines: 1,
                                ),
                              ),
                          )),

                          SizedBox(width: 15),
                          //===========================الاسم الاول =====
                          Expanded(flex:1,
                            child:new Container(
                            height: 50,
//                      color: Colors.grey,
                              child: new TextField(
                                controller: firstName,
                                keyboardType: TextInputType.text,
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                  suffixIcon:Icon(Icons.supervisor_account),
                                  hintText: 'الاسم الاول',
                                  hintMaxLines: 1,
                                ),
                              ),
                          )),


                        ],
                      ),
                    ),



                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: new Row(
                        children: <Widget>[

                          //=مفتاح الدولة===============================
                          Expanded(flex:2,
                            child:new Container(
                            height: 40,
//                      color: Colors.grey,
                              child: new Text("+966",style: TextStyle(fontSize: 20),),
                          )),


                          //=رقم الهاتف===============================
                          Expanded(flex:4,
                            child:new Container(
                            height: 40,
//                      color: Colors.grey,
                              child: new TextField(
                                controller: phone,
                                keyboardType: TextInputType.phone,
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                  suffixIcon:Icon(Icons.phone_android),
                                  hintText: 'الجوال',
                                  hintMaxLines: 1,
                                ),
                              ),
                          )),


                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
 //===========================password  =====
                        new Container(
                            height: 50,
//                      color: Colors.grey,
                              child: new TextField(
                                controller: email,
                                keyboardType: TextInputType.emailAddress,
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                  suffixIcon:Icon(Icons.email),
                                  hintText: '  البريد الالكتروني',
                                  hintMaxLines: 1,
                                ),
                              ),
                          ),
SizedBox(height: 15,),
 //===========================password  =====
                        new Container(
                            height: 50,
//                      color: Colors.grey,
                              child: new TextField(
                                controller: pass,
                                keyboardType: TextInputType.text,
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                  suffixIcon:Icon(Icons.lock_outline),
                                  hintText: ' كلمة المرور',
                                  hintMaxLines: 1,
                                ),
                              ),
                          ),
SizedBox(height: 15,),
                          //===========================password=====
                        new Container(
                            height: 50,
//                      color: Colors.grey,
                              child: new TextField(
                                controller: repass,
                                keyboardType: TextInputType.text,
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                  suffixIcon:Icon(Icons.lock_outline),
                                  hintText: 'تاكيد كلمة المرور',
                                  hintMaxLines: 1,
                                ),
                              ),
                          ),
                    //==============================زر امتلك حساب==
                    SizedBox(height: 40),
                    my_Button(horizontal: 10 , textButton: "امتلك حساب" ,onBtnclicked: (){
                      if(firstName.text.trim() != "" &&
                         lastName.text.trim() != "" &&
                         email.text.trim() != "" &&
                         phone.text.trim() != "" &&
                         pass.text == repass.text &&
                          pass.text.trim() != "" &&
                          repass.text.trim() != ""
                      ){
                        _makePostRequest().then((v){
                          if(v == true){
                            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeOnePage())
                );
                          }
                        });
                      }
                    },
                      colorButton: anRed , fontSize: 18 , heightButton: 60 ,radiusButton: 10
                    ),


                  ],
                )),
              ),
                  ],
          ),
        ),


      
    );
  }
Future _makePostRequest() async {
  try{String url = 'https://jaki-taxi.com/admin/android/index.php/web_service/driver_sign_up';
  Map<String, String> headers = {"Content-type": "application/json"};
  String jsn = '{"username": "${firstName.text} ${lastName.text}", "email": "${email.text}", "mobile": "${phone.text} , "password" : "${pass.text}" "}';
  Response response = await post(url, headers: headers, body: jsn);
  int statusCode = response.statusCode;
  var body = json.decode(response.body);
  print(body);
  if(body["status"] != "failed"){
    _saveTok(body["token"]);
    _saveuserId(body["user_id"]);
    _savedriverId(body["driver_id"]);
    return true;
  }
  }
  catch(e){
    print(e);
    tostDialog("$e");
  }
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

    _savedriverId(driverid) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'driverid';
    final value = driverid;
    prefs.setString(key, value);
    print("saved in prefren driverid : $driverid");
   }

   
}