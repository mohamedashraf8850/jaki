import 'package:flutter/material.dart';
import 'package:jaki_kapten/Component/shareWedget.dart';
import 'package:jaki_kapten/FrontEnd/aboutApp/about_tabs.dart';
import 'package:jaki_kapten/FrontEnd/home/home_one.dart';
import 'package:jaki_kapten/FrontEnd/playment/payment.dart';
import 'package:jaki_kapten/FrontEnd/setting/settings.dart';
import 'package:jaki_kapten/FrontEnd/trip/trip_tabs.dart';
import 'package:jaki_kapten/ToolsApp/app_Colors.dart';

class MyDrawer extends StatefulWidget {
  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<MyDrawer> {

  String imageUser = 'https://i7.pngguru.com/preview/178/419/741/computer-icons-avatar-login-user-avatar.jpg' ;
  double fontSize = 16 ;
  double iconSize = 23 ;





  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: Directionality(textDirection: TextDirection.rtl,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[


            new Container(
              padding: EdgeInsets.only(right: 10,top:25),
              height: 220,
              color: anRed,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //-------------------- صورة المستخدم  ---------------
                  Align(alignment: Alignment.center,child: my_ImageCircleAccount(imagURL: imageUser ,width: 100 , borderColor: anWhite ,borderWidth: 1)),

                  //-------------------- بيانات المستخدم الاسم والوظيفة   ---------------
                  new Text("محمد بن راشد " , style: TextStyle(fontSize: 18 ,color: anWhite),),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text("+201143243659" , style: TextStyle(fontSize: 15 ,color: anWhite),),
                      new IconButton(icon: Icon(Icons.settings , color: anWhite,), onPressed: (){}),
                    ],
                  )
                ],
              ),
            ),



            new ListTile(
              title: Text("الرئيسية"),
              leading: Image.asset("assets/images/place.png" ,scale: 5,),
              onTap: (){
                Navigator.push(
              context, MaterialPageRoute(builder: (context) =>HomeOnePage())
              );
              },
            ),


            new ListTile(
              title: Text("الرحلات والطلبات"),
              leading: Image.asset("assets/images/sahra.png" ,scale: 5,),
              onTap: (){
                  Navigator.push(
              context, MaterialPageRoute(builder: (context) => TripsTabsPage())
              );
              },
            ),



            new ListTile(
              title: Text("عمليات الدفع"),
              leading: Image.asset("assets/images/visa.png" ,scale: 5,),
              onTap: (){
 Navigator.push(
              context, MaterialPageRoute(builder: (context) => PaymentPage())
              );
                
              },
            ),


  new ListTile(
              title: Text("الاعدادات"),
              leading: Image.asset("assets/images/user.png" ,scale: 5,),
              onTap: (){
Navigator.push(
              context, MaterialPageRoute(builder: (context) =>SettingsPage())
              );
                
              },
            ),

            new ListTile(
              title: Text(" التواصل معنا "),
              leading: Image.asset("assets/images/chat.png" ,scale: 5,),
              onTap: (){},
            ),




            new ListTile(
              title: Text("من نحن"),
              leading: Image.asset("assets/images/user.png" ,scale: 5,),
              onTap: (){
Navigator.push(
              context, MaterialPageRoute(builder: (context) => SettingTabsPage())
              );
                
              },
            ),



            new ListTile(
              title: Text("سياسة الخصوصية"),
              leading: Image.asset("assets/images/edite.png" ,scale: 5,),
              onTap: (){},
            ),


            new ListTile(
              title: Text("تسجيل خروج"),
              leading: Image.asset("assets/images/oute.png" ,scale: 5,),
              onTap: (){},
            ),



          ],
        ),
      ),
    );
  }
}