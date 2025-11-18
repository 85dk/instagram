import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram/widgets/InstagramReelsIcon.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  
final List<Map<String, String>>postdetails=[
  {'image':'https://wallpaperaccess.com/thumb/4602806.jpg','isreel':'false'},
  {'image':'https://wallpaperaccess.com/thumb/4602809.jpg','isreel':'false'},
  {'image':'https://wallpaperaccess.com/thumb/4602812.jpg','isreel':'false'},
  {'image':'https://wallpaperaccess.com/thumb/4602926.jpg','isreel':'false'},
  {'image':'https://wallpaperaccess.com/thumb/4602706.jpg','isreel':'true'},
  {'image':'https://wallpaperaccess.com/thumb/4602426.jpg','isreel':'false'},
  {'image':'https://wallpaperaccess.com/thumb/4602432.jpg','isreel':'false'},
  {'image':'https://wallpaperaccess.com/thumb/4602866.jpg','isreel':'true'},
  {'image':'https://wallpaperaccess.com/thumb/4602898.jpg','isreel':'true'},
  {'image':'https://wallpaperaccess.com/thumb/4603891.jpg','isreel':'false'},
  {'image':'https://wallpaperaccess.com/thumb/4602898.jpg','isreel':'true'},
  {'image':'https://wallpaperaccess.com/thumb/4602926.jpg','isreel':'false'},

    
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            child:GridView.builder(
              //shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:3,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 1,
                 ), 
                 itemCount: postdetails.length,
              itemBuilder: (context,index){
                return Stack(
                  children: [
                    Container(
                      height: 100,
                    color: Colors.grey.shade800,
                    child: Image.network(
                      postdetails[index % postdetails.length]['image']!, 
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: 
                    Icon(
                      postdetails[index]['isreel'] == 'true'
                          ? Icons.video_collection_outlined
                          : null,
                      color: Colors.white,
                      size: 16,
                    )
                    )
                  ],
                   
                );

              }) ,
           
                  ),
          
      ],)
    );
  }
}
 