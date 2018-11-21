import 'dart:convert';

import 'package:car_pool/model/user.dart';
import 'package:car_pool/presenter/Pin.dart';
import 'package:car_pool/util/FutureProgess.dart';
import 'package:car_pool/util/NetworkUtil.dart';
import 'package:car_pool/util/SharedPreferencesUtil.dart';
import 'package:car_pool/view/FormLogin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:car_pool/model/post.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:car_pool/util/NavigationUtil.dart';


class Login extends StatefulWidget {
  Login({Key key, this.title, this.post, this.loading}) : super(key: key);

  final Future<Post> post;
  final String title;
  final bool loading;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final String USERID = "UserID";
  final String TOKEN = "Token";

  int _counter = 0;
  Future<User> user;
  bool doLoginUser;
  bool doSavingUser;
  String ErrorMessage;
  int savedUserId;
  String savedToken = "";

  final TextEditingController TextFieldMemberCode = new TextEditingController();
  final TextEditingController TextFieldUsername = new TextEditingController();
  final TextEditingController TextFieldPassword = new TextEditingController();

  @override
  void initState() {
    super.initState();
    doLoginUser = false;
    doSavingUser = false;
  }

  void Login() {
    setState(() {
      doLoginUser = true;
      user = new User().login(TextFieldMemberCode.text, TextFieldUsername.text,
          TextFieldPassword.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: doLoginUser
            ? FutureProgress<User>(
                future: user,
                onFailure: (context, snapshoot) {
                  doLoginUser = false;
                  ErrorMessage = "Invalid Member Code, User Name and Password";
                  return LoginForm();
                },
                onSuccess: (context, snapshoot) {
                  doLoginUser = false;
                  doSavingUser = true;
                  SaveUser(snapshoot.data);
                  return Container();
                },
              )
            : doSavingUser ? CircularProgressIndicator() : LoginForm(),
      ),
    );
  }

  Widget LoginForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 50.0),
          child: Image.asset("assets/logo.png"),
        ),
        FormLogin(
          MemberNameController: TextFieldMemberCode,
          PasswordController: TextFieldPassword,
          UsenameController: TextFieldUsername,
          SubmitText: "Login",
          onSubmit: Login,
          ErrorMessage: ErrorMessage,
        )
      ],
    );
  }

  SaveUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(USERID, user.UserId);
    prefs.setString(
        TOKEN,
        new NetworkUtil().generateMd5(
            TextFieldUsername.text + "|" + TextFieldPassword.text));

    savedUserId = (prefs.getInt(USERID) ?? 0);
    savedToken = (prefs.getString(TOKEN) ?? "");
    doSavingUser = false;
    setState(() {
      NavToPin(context);
    });
  }
}
