//initialize all navigation and public function
import 'package:car_pool/presenter/Login.dart';
import 'package:car_pool/presenter/Pin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void NavToPin(BuildContext context, {bool CanBack = true}) {
  if(CanBack){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Pin()),
    );
  }
  else{
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Pin()),
    );
  }

}

void NavToLogin(BuildContext context, {bool CanBack = true}){
  if(CanBack){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }
  else{
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }
}