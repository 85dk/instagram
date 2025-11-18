import 'package:flutter/material.dart';

class Repost extends StatelessWidget {
  const Repost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
      crossAxisAlignment: CrossAxisAlignment.center, 
       
        children: [
           Center(child: Text("No reposts",style: const TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold),)),
             Center(child: Text("There are no reposts to show",style: const TextStyle(color: Colors.black45, fontSize: 14),)),
            

        ],)
      
      );
  
  }
}