import 'dart:async';

import 'package:class_9/admin_screen.dart';
import 'package:class_9/home_screen.dart';
import 'package:class_9/login_screen.dart';
import 'package:class_9/student_screen.dart';
import 'package:class_9/teacher_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();

  }
   void isLogin()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('userType') ?? '';
    if (isLogin){
      if(userType == 'student'){
        Timer(Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=> StudentScreen()));
        });
      }else if(userType == 'teacher'){
        Timer(Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=> TeacherScreen()));
        });
      }else{
        Timer(Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=> AdminScreen()));
        });
      }

    }else{
      Timer(Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=> LoginScreen()));
      });
    }
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(image: NetworkImage('https://images.pexels.com/photos/9986235/pexels-photo-9986235.jpeg?auto=compress&cs=tinysrgb&w=600'),
       fit: BoxFit.fitHeight,
      height: double.infinity,),
    );
  }
}


