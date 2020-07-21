
import 'package:flutter/material.dart';
import 'package:jaki_kapten/FrontEnd/aboutApp/about.dart';
import 'package:jaki_kapten/FrontEnd/aboutApp/terms.dart';
import 'package:jaki_kapten/ToolsApp/app_Colors.dart';


class SettingTabsPage extends StatefulWidget {
  @override
  _AccountTabsPageState createState() => _AccountTabsPageState();
}

class _AccountTabsPageState extends State<SettingTabsPage> {
  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: anWhite,
                leading: InkWell(child: Icon(Icons.arrow_back,color: Colors.black,),
                onTap: (){Navigator.pop(context);},),
            bottom: TabBar(
              labelColor: anRed,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(text: 'نحن',),
                Tab(text: 'الخصوصية',),
                
               
              ],
            ),
            title:Container(
              margin: EdgeInsets.only(top:15),
              child:Center(child:Image.asset('assets/images/logo2.png',height:50))),
          ),
          body: TabBarView(
            children: [
              AboutPage(),
                TermesPage(),

            
             
            ],
          ),
        ),
      ));
  }
}