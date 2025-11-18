import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
   final ImagePicker _imagePicker = ImagePicker();
  File? _image;

  // Pick image from camera
  Future<void> pickImage() async {
    var data = await _imagePicker.pickImage(source: ImageSource.camera);
    if (data != null) {
      setState(() {
        _image = File(data.path);
      });
    }
  }

// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet:Container(
      width: double.maxFinite,
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              
              Center(child: Text("Create",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),),
            ],
          ),
          Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.video_collection_outlined)),
              Text("Reel",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
            ],
          ),
          Divider(),
          Row(
            children: [
               IconButton(onPressed: (){}, icon: Icon(Icons.movie_edit),),
              Text("Edits",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
            ],
          ),
          Divider(),
          Row(
            children: [
               IconButton(onPressed: (){}, icon: Icon(Icons.grid_on_outlined),),
              Text("Post",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
            ],
          ),
          Divider(),
           Row(
            children: [
               IconButton(onPressed: (){}, icon: Icon(Icons.add_circle_outline),),
              Text("Story",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
            ],
          ),
          Divider(),
           Row(
            children: [
               IconButton(onPressed: (){}, icon: Icon(Icons.circle_outlined),),
              Text("Story",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
            ],
          ),
          Divider(),
           Row(
            children: [
               IconButton(onPressed: (){}, icon: Icon(Icons.star_outline_rounded),),
              Text("AI",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
            ],
          ),
        ],
      ),
    ) ,
    );
  }
}