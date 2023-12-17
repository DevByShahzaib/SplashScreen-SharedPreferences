import 'package:class_9/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email = '', age = '';
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
    setState(() {

    });

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Home'),automaticallyImplyLeading: false,centerTitle: true,),
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
                  Text(age.toString(), style: TextStyle(fontSize: 18),),

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
