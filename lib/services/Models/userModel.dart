

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class UserModel {
 String name;
String username;
String email;
String mobile;
String password;
bool isdevice;
String gender;
String dob;
int facebookId;
int twitterId;
String image ;
String devid;
int userCode;

  UserModel({
   @required this.name,
@required this.username,
@required this.email,
@required this.mobile,
@required this.password,
@required this.isdevice,
@required this.gender,
@required this.dob,
@required this.facebookId,
@required this.twitterId,
@required this.image ,
@required this.devid,
@required this.userCode,
  });

  UserModel.getALL({
     @required this.name,
@required this.username,
@required this.email,
@required this.mobile,
@required this.password,
@required this.isdevice,
@required this.gender,
@required this.dob,
@required this.facebookId,
@required this.twitterId,
@required this.image ,
@required this.devid,
@required this.userCode,
  });

  UserModel.fromMap(Map<String, dynamic> res) {
 this.name= res['name'];
 this.username= res['username'];
 this.email= res['email'];
 this.mobile= res['mobile'];
 this.password= res['password'];
 this.isdevice= res['isdevice'];
 this.gender= res['gender'];
 this.dob= res['dob'];
 this.facebookId= res['facebook_id'];
 this.twitterId= res['twitter_id'];
 this.image = res['image'];
 this.devid= res['devid'];
 this.userCode= res['userCode'];
  }

  Map<String, dynamic> toMap() {
    return {
'name':name,
'username':username,
'email':email,
'mobile':mobile,
'password':password,
'isdevice':isdevice,
'gender':gender,
'dob':dob,
'facebook_id':facebookId,
'twitter_id':twitterId,
'image':image,
'devid':devid,
'userCode':userCode,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel.getALL(
      name: json['name'],
      username: json['username'],
      email: json['email'],
      mobile: json['mobile'],
      password: json['password'],
      isdevice: json['isdevice'],
      gender: json['gender'],
      dob: json['dob'],
      facebookId: json['facebook_id'],
      twitterId: json['twitter_id'],
      image : json['image'],
      devid: json['devid'],
      userCode: json['userCode'],
    );
  }
}
