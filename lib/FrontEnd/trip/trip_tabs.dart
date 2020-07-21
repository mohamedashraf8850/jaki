
import 'package:flutter/material.dart';
import 'package:jaki_kapten/FrontEnd/trip/trip_completed.dart';
import 'package:jaki_kapten/FrontEnd/trip/trip_penddeng.dart';
import 'package:jaki_kapten/ToolsApp/app_Colors.dart';

class TripsTabsPage extends StatefulWidget {
  @override
  _AccountTabsPageState createState() => _AccountTabsPageState();
}

class _AccountTabsPageState extends State<TripsTabsPage> {
   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child:DefaultTabController(
        length: 2,
        child: Scaffold(
          key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
           leading: InkWell(child: Icon(Icons.arrow_back,color: Colors.black,),
                onTap: (){Navigator.pop(context);},),
            backgroundColor: anWhite,
            bottom: TabBar(
              labelColor: anRed,
              unselectedLabelColor: Colors.black,
              tabs: [
               
                 Tab(text: 'المكتملة',),
                Tab(text: 'المعلقة',),

                
               
              ],
            ),
            title:Container(
              // margin: EdgeInsets.only(top:15),
              child:Center(child:Text("الرحلات والطلبات",style: TextStyle(color: Colors.black),))),
          ),
          body: TabBarView(
            children: [
              HoistryTripPage(),
                NextTripPage(),
            
             
            ],
          ),
        ),
      ));
  }
}