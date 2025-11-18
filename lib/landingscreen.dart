import 'package:flutter/material.dart';
import 'package:instagram/loginscreen.dart';
import 'package:instagram/registrationscreen.dart';

class Landingscreen extends StatefulWidget {
  const Landingscreen({super.key});

  @override
  State<Landingscreen> createState() => _LandingscreenState();
}

class _LandingscreenState extends State<Landingscreen> {
  List<String>counteries=["English(India)","English(Uk)","English(Us)"];
String selected="English(India)";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
             children: [
              DropdownButton<String>(value: selected,icon: Icon(Icons.arrow_drop_down,color: Colors.white70,),onChanged: (String? data) {
               setState(() {
                  selected=data!;
               });
              },items: counteries.map<DropdownMenuItem<String>>((String? item){
                return DropdownMenuItem(value: item,child: Text("$item"));
              }).toList()
              ),
              Image.asset("assets/images/landing1.png",height: 300,width: 300,),
              Text("Join Intagram",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
              Text("Share whta you're into with the \n         peole who get you.",style: TextStyle(fontSize: 20,),),
              SizedBox(height: 50,),
              OutlinedButton(onPressed: (){ Navigator.push(context,MaterialPageRoute(builder: (context) => Registrationscreen()),
                );}, 
                style: OutlinedButton.styleFrom(
                fixedSize: Size(250, 10),
                foregroundColor: Colors.white,       // Text & icon color
                backgroundColor: Colors.blueAccent,
                 side: BorderSide(color: Colors.blueAccent),       // Button background color
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
               shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20),
               ),
               elevation: 0,  // No shadow by default
               ),
               child: Text("Get started"),),
               SizedBox(height: 8,),
               OutlinedButton(onPressed: (){ Navigator.push(context,MaterialPageRoute(builder: (context) => const Loginscreen()),);}, 
               style: OutlinedButton.styleFrom(
                fixedSize: Size(250, 10),
                foregroundColor: Colors.black,       // Text & icon color
                backgroundColor: Colors.white,
                 side: BorderSide(color: Colors.grey,width: 1),       // Button background color
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
               shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20),
               ),
               elevation: 0,  // No shadow by default
               ),child: Text("I already have an account"),),
               Opacity(opacity: 0.5,
                child: Image.asset("assets/images/logo_meta.png",height:150 ,width: 200,))
             ], 
            )
          ),
        ),
      ),
    );
  }
}