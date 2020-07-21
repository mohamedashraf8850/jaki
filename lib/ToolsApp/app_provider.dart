import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier{
  AppProvider();
  String imgurl , name , gender , phone , userStatus , city;

  void setUserData({String img , String nam , String gend , String ph , String stt, String cit}){
    imgurl = img??imgurl;
    name = nam??name;
    gender = gend??gender;
    phone = ph??phone;
    userStatus = stt ?? userStatus;
    city = cit ?? city;
    notifyListeners();
  }

  get getimg => imgurl;
  get getname => name;
  get getgender => gender;
  get getphone => phone;
  get getuserStatus => userStatus;
  get getcity => city;
}