import 'package:class_9/admin_screen.dart';
import 'package:class_9/home_screen.dart';
import 'package:class_9/student_screen.dart';
import 'package:class_9/teacher_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailControler = TextEditingController();
  final passwordControler = TextEditingController();
  final ageControler = TextEditingController();
  final typeControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sign up'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailControler,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              controller: passwordControler,
              decoration: InputDecoration(
                hintText: 'Password',

              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: ageControler,
              decoration: InputDecoration(
                hintText: 'Age',
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: typeControler,
              decoration: InputDecoration(
                hintText: 'type: student, teacher, admin',
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: ()async{
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('email', emailControler.text.toString());
                  sp.setString('age', ageControler.text.toString());
                  sp.setString('userType', typeControler.text.toString());

                  // admin, user, student
                  // sp.setString('userType', 'admin'); // manual set userType
                  sp.setBool('isLogin', true);

                  if( sp.getString('userType') == 'student'){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> StudentScreen()));
                  }else if(sp.getString('userType') == 'teacher'){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> TeacherScreen()));
                  }else if(sp.getString('userType') == 'admin'){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> AdminScreen()));

                  }


                },
                child: Container(
                  height: 50,
                  child: Center(child: Text('sign up', style: TextStyle(color: Colors.white))),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.deepOrange
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Future<void> shah() async{
  //   await Future.delayed(Duration(seconds: 5));
  //   print('delayed');

  }

