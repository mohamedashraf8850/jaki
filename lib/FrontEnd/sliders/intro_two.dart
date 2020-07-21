import 'package:flutter/material.dart';
import 'package:jaki_kapten/Component/shareWedget.dart';
import '../../ToolsApp/app_Colors.dart';

class SecondPage extends StatefulWidget {
  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<SecondPage> {

  String image = 'assets/images/intro3.png';
  String title = "استقبل رحلاتك بسهولة  ";
  String subtitle = "نمتلك داخل التطبيق واجهة سهلة الاستخدام لاستقبال رحلات الركاب لتحقيق اقصي استفادة ممكنه من التطبيق  ";

  void skip(){
    print('Skip');
  }

  void next(){
    print('Next');
  }

  @override
  Widget build(BuildContext context) {
    return  new Scaffold(

        body: SingleChildScrollView(
                  child: Column(
            children: <Widget>[

              Stack(
                overflow: Overflow.visible,
                children: <Widget>[

                  Container(
                      height: 400, width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 60 , left: 30),
                      color: anGrey,
                      child: new Column(
                        children: <Widget>[

                          InkWell(
                          onTap:skip,
                          child: Align(alignment: Alignment.bottomLeft,
                          child: new Text("تخطي",style: TextStyle(fontSize: 16 ,
                          color: Colors.black45),))),

                        ],
                      )
                  ),

                  Positioned(
                    bottom: -60, right: 40, left: 40,
                    child:new Container(
                      height: 370,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("$image"))
                      ),
                    ),
                  ),


                ],
              ),

              SizedBox(height: 50,),
              new Text("$title", style: TextStyle(fontSize: 18),),
              Padding(
                padding: const EdgeInsets.only(top: 20 , left: 20 ,right: 20),
                child: new Text("$subtitle", style: TextStyle(fontSize: 16 ,color: Colors.grey),
                textAlign: TextAlign.center),
              ),


              my_Button(textButton: "التالي",horizontal: 95,vertical: 30,radiusButton: 30,
              heightButton: 60,fontSize: 18,onBtnclicked: (){
                //  Navigator.push(
                // context, MaterialPageRoute(builder: (context) => ThirdPage())
                // );
              },colorButton: Colors.black)


            ],
          


      ),
        ),
    );
  }
}