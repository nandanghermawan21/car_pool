import 'package:car_pool/presenter/Login.dart';
import 'package:car_pool/presenter/Pin.dart';
import 'package:car_pool/util/NavigationUtil.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:splashscreen/splashscreen.dart';

//run app
void main() {
  runApp(new MaterialApp(home: new MainState()));
}

class MainState extends StatefulWidget {
  MainState();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Initialize();
  }
}

class Initialize extends State<MainState> {
  final String USERID = "UserID";
  final String TOKEN = "Token";
  int savedUserId;
  String savedToken = "";

  @override
  void initState() {
  }


  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: GetUser(),
        title: new Text(
          'Welcome In SplashScreen',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: Image.asset("assets/logo.png"),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Colors.red);

  }

  GetUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //setState(() {
    savedUserId = (prefs.getInt(USERID) ?? 0);
    savedToken = (prefs.getString(TOKEN) ?? "");

    setState(() {
      if (savedToken.isNotEmpty && savedUserId > 0) {
        NavToPin(context, CanBack: false);
      } else {
        NavToLogin(context, CanBack: false);
      }
    });
  }
}

