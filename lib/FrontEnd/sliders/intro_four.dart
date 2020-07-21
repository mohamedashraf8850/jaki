import 'package:flutter/material.dart';
import 'package:jaki_kapten/Component/shareWedget.dart';
import 'package:jaki_kapten/FrontEnd/account/account_tabs.dart';
import 'package:jaki_kapten/services/Models/location.dart';
import '../../ToolsApp/app_Colors.dart';

class GPSPage extends StatefulWidget {
  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<GPSPage> {

  String image = 'assets/images/intro1.png';
  String title = "تحديد الموقع  ";
  String subtitle = "من فضلك قم بتفعيل ال GPS من اجل الحصول علي اقصي استفادة من التطبيق واستقبال طلبات الركاب ";

  void skip(){
    print('Skip');
  }
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  new Scaffold(

        body: Column(
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

                        // InkWell(
                        // onTap:Skip,
                        // child: Align(alignment: Alignment.bottomLeft,
                        // child: new Text("تخطي",style: TextStyle(fontSize: 16 ,
                        // color: Colors.black45),))),

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
              child: new Text("$subtitle", style: TextStyle(fontSize: 18 ,color: Colors.grey),
              textAlign: TextAlign.center),
            ),
BottomAppBar(
child:my_Button(textButton: "GPS تفعيل ال",horizontal: 0,vertical: 0,radiusButton: 2,
            heightButton: 60,fontSize: 18,onBtnclicked: (){
              getLocation().then((v){
                print("get the : $v");
                Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AccountTabsPage())
              );
              });
               
            },colorButton:anRed))


          ],
        ),


      
    );
  }
}