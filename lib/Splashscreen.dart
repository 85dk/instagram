import 'dart:async';
import 'package:flutter/material.dart';
import 'package:instagram/views/homescreen.dart';
import 'package:instagram/landingscreen.dart';
import 'package:instagram/loginscreen.dart';
import 'package:instagram/service/user_service.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  final email="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checklogin();
  }
  UserService userService=UserService();
  void checklogin(){
 Timer(Duration(seconds: 5), () async {
  if(await userService.isLoggedin()==true){
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Homescreen()));
  }
  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Landingscreen()));
 });
  }
  @override
  Widget build(BuildContext context) {
 return Scaffold(
      body: Column(
        children: [
           Stack(
            children: [
             Container(
              height: 600,
              width: 700,
              
              alignment: Alignment.center,
               child: Image.asset( "assets/images/instagram1.png",height: 50,width: 50,),
             ),
             Positioned(
              bottom: 70,
              left: 180,
              right: 20,
              child: Text("from",style: TextStyle(color: Colors.grey[500],fontSize: 16,fontWeight: FontWeight.w600),)
              ),
             Positioned(
              bottom: 10,
               left:0,
              right: 5,
              child: Center(
               child: ShaderMask(
             shaderCallback: (bounds) =>  LinearGradient(
                begin: Alignment.topLeft,
              end: Alignment.bottomRight,
                colors: [
          Color(0xFF833AB4), // Purple
          Color(0xFFC13584), // Pink
          Color(0xFFF77737), // Orange
          Color(0xFFFFDC80), // Yellow
                 ],
             ).createShader(bounds),
            blendMode: BlendMode.srcIn, // keeps the image shape, applies gradient inside
       child: Image.asset( "assets/images/meta_logo.png",
        height: 60,
        width: 100,
        fit: BoxFit.cover,
      ),
    ),
  ),
)


            ],

            
           ),
        ],
      ),
    );
  }
}
