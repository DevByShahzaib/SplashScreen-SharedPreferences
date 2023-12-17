import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:class_9/login_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  String email = '', age = '', type = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    age = sp.getString('age') ?? '';
    type = sp.getString('userType') ?? '';
    setState(() {

    });

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Admin View'),automaticallyImplyLeading: false,centerTitle: true,),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text('Email :', style: TextStyle(fontSize: 18),),
                  SizedBox(width: 10,),
                  Text(email.toString(), style: TextStyle(fontSize: 16),),

                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text('Age :', style: TextStyle(fontSize: 18),),
                  SizedBox(width: 10,),
                  Text(age.toString(), style: TextStyle(fontSize: 18,),),

                ],

              ),
              Row(
                children: [
                  Text('User Type :', style: TextStyle(fontSize: 18),),
                  SizedBox(width: 10,),
                  Text(type.toString(), style: TextStyle(fontSize: 18),),

                ],

              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: ()async{
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.clear();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> LoginScreen()));

                },
                child: Container(
                  height: 50,
                  child: Center(child: Text('Logout', style: TextStyle(color: Colors.white),)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.deepOrange
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

