import 'dart:convert';

import 'package:car_pool/util/NetworkUtil.dart';

class User {
  int UserId;
  int MemberId;
  String UserFullName;
  String MemberName;
  int UserType;
  String Token;
  String LastAndroidAppVersionCode;
  String Message;


  User(
      {this.UserId,
      this.MemberId,
      this.UserFullName,
      this.MemberName,
      this.UserType,
      this.Token,
      this.LastAndroidAppVersionCode,
      this.Message});

  factory User.fromJson(Map<String, dynamic> json) {
    User user = new User();
    try {
      user.UserId = json['UserId'];
    }
    catch (e) {
      user.Message = "error get UserId from return json";
      return user;
    }

    try {
      user.MemberId = json['MemberId'];
    }
    catch (e) {
      user.Message = "error get MemberId from return json";
      return user;
    }

    try {
      user.UserFullName = json['UserFullName'];
    }
    catch (e) {
      user.Message = "error get UserFullName from return json";
      return user;
    }

    try {
      user.MemberName = json['MemberName'];
    }
    catch (e) {
      user.Message = "error get MemberName from return json";
      return user;
    }

    try {
      user.UserType = json['UserType'];
    }
    catch (e) {
      user.Message = "error get UserType from return json";
      return user;
    }


    try {
      user.Token = json['Token'];
      if(user.Token == null){
      }
    }
    catch (e) {
      user.Message = "error get Token from return json";
      return user;
    }

    try {
      user.LastAndroidAppVersionCode = json['LastAndroidAppVersionCode'];
    }
    catch (e) {
      user.Message = "error get LastAndroidAppVersionCode from return json";
      return user;
    }

    return user;
  }

  Future<User> login(String MemberCode, String username, String password) {
    NetworkUtil _netUtil = new NetworkUtil();
    return _netUtil
        .get(_netUtil.LoginUrl(MemberCode, username, password))
        .then((dynamic res) {
      print(res.toString());
      if (res.toString().length > 0) {
        return User.fromJson(json.decode(res.toString()));
      }
    });
  }
}
