import 'package:flutter/material.dart';
import 'package:jaki_kapten/splash.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ToolsApp/app_provider.dart';

void main() => runApp(ChangeNotifierProvider<AppProvider>(
    create: (_) => AppProvider(), child: MyApp()));

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int data;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (FutureBuilder<bool>(
        future: getData(),
        builder: (buildContext, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data) {
              // Return your login here
              return Splash();
            }

            // Return your home here
            return Splash(havedata: data);
          } else {
            // Return loading screen while reading preferences
            return Center(child: CircularProgressIndicator());
          }
        },
      )),
      locale: const Locale('ar'),
      theme: ThemeData(
        fontFamily: 'cairo',
        unselectedWidgetColor: Colors.white,
      ),
    );
  }

  Future<bool> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    String id = prefs.getString('userid');
    print("get saved : $token");
    if (token != null) {
      print("get saved : $token");
      data = 1;
    }
    return data == null;
  }
}
