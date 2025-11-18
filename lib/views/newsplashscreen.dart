import 'package:flutter/material.dart';

class Newsplashscreen extends StatelessWidget {
  const Newsplashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           Stack(
            children: [
             Container(
              height: 800,
              width: 800,
              alignment: Alignment.center,
               child: Image.asset( "assets/images/instagram1.png",height: 50,width: 50,),
             ),
             Positioned(
              bottom: 50,
              left: 180,
              right: 20,
              child: Text("from",style: TextStyle(color: Colors.grey[500],fontSize: 16,fontWeight: FontWeight.w600),)
              ),

             Positioned(
              bottom: 0,
               left: 0,
              right: 20,
              child: Center(
               child: ShaderMask(
             shaderCallback: (bounds) => const LinearGradient(
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
      child: Image.asset(
        "assets/images/meta_logo.png",
        height: 80,
        width: 80,
        fit: BoxFit.contain,
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