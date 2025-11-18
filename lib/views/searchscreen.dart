import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
final List<String> imagelist = [
  "https://wallpaperaccess.com/thumb/4602806.jpg",
  "https://wallpaperaccess.com/thumb/4602809.jpg",
  "https://wallpaperaccess.com/thumb/4602812.jpg",
  "https://wallpaperaccess.com/thumb/4602926.jpg",
  "https://wallpaperaccess.com/thumb/4602706.jpg",
  "https://wallpaperaccess.com/thumb/4602426.jpg",
  "https://wallpaperaccess.com/thumb/4602432.jpg",
  "https://wallpaperaccess.com/thumb/4602866.jpg",
  "https://wallpaperaccess.com/thumb/4602898.jpg",
  "https://wallpaperaccess.com/thumb/4603891.jpg",
  
];
final List<Map<String, dynamic>> tagimages = List.generate(
  20,
  (index) => {
    'image': 'https://picsum.photos/id/${index + 10}/300/300',                            
  },
);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle:  TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.black87),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                style:const  TextStyle(color: Colors.white),
              ),
            ),
          //  SizedBox(height: 2,),
            Expanded(
              child: GridView.custom(
              gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 6,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    pattern: [
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(4, 2),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(2, 2),
              
                    ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
      final item = tagimages[index];
      return Container(
        color: Colors.grey.shade800,
        child: Image.network(
          item['image'],
          fit: BoxFit.cover,
        ),
      );
        },
        childCount: tagimages.length, // important
      )
      
                    ),
            ),
          ],
        )
      ),
    );
  }
}
/*
 childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                  color: Colors.grey.shade800,
                  child: Image.network(
                    imagelist[index % imagelist.length], 
                    fit: BoxFit.cover,
                  ),
                ),
                childCount: imagelist.length, // 🔥 important to avoid RangeError
              ),
*/