import 'package:flutter/material.dart';

class Tags extends StatefulWidget {
  const Tags({super.key});

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  final List<Map<String, dynamic>> tagimages = List.generate(
  20,
  (index) => {
    'image': 'https://picsum.photos/id/${index + 10}/300/300',
    'isreel': index % 4 == 0, // every 4th item is a reel
  },
);



  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Column(children: [
        Expanded(
            child:GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:3,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                 ), 
                 itemCount: tagimages.length,
              itemBuilder: (context,index){
                return Stack(
                  children: [
                    Container(
                      height: 100,
                    color: Colors.grey.shade800,
                    child: Image.network(
                      tagimages[index % tagimages.length]['image']!, 
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: 
                    Icon(
                      tagimages[index]['isreel'] == 'true'
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
 