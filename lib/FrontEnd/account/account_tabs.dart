
import 'package:flutter/material.dart';
import 'package:jaki_kapten/FrontEnd/account/profile.dart';
import 'package:jaki_kapten/ToolsApp/app_Colors.dart';

import 'login.dart';

class AccountTabsPage extends StatefulWidget {
  @override
  _AccountTabsPageState createState() => _AccountTabsPageState();
}

class _AccountTabsPageState extends State<AccountTabsPage> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: anWhite,
            bottom: TabBar(
              labelColor: anRed,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(text: 'انشاء حساب جديد',),
                Tab(text: 'تسجيل الدخول',),
                
               
              ],
            ),
            title:Container(
              margin: EdgeInsets.only(top:15),
              child:Center(child:Image.asset('assets/images/logo2.png',height:50))),
          ),
          body: TabBarView(
            children: [
                UserProfileType(),
              LoginPage(),
            
             
            ],
          ),
        ),
      );
  }
}