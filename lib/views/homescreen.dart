import 'package:flutter/material.dart';
import 'package:instagram/service/user_service.dart';
import 'package:instagram/views/camera/fliter.dart';
import 'package:instagram/widgets/postcard.dart';
import 'package:instagram/widgets/highlightcircle.dart';
import 'package:instagram/widgets/verlappingprofilecircles%20.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatefulWidget {

  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String email="";
   final List<Map<String, dynamic>> storesimage = List.generate(
  20,
  (index) => {
    'image': 'https://picsum.photos/id/${index + 10}/300/300',
   
  },
);
final List<String> usernames = [
  'alic_e', 'bob', 'charlie', 'david', 'emma',
  'frank', 'grace', 'harry', 'isla', 'jack',
  'kate', 'leo', 'mia', 'nina', 'oliver',
  'paul', 'quinn', 'rose', 'sam', 'tina'
];
final List<Map<String, dynamic>> posts = [
  {
    'username': 'travel_guru',
    'profileImage': 'https://picsum.photos/id/1015/100/100',
    'location': 'Switzerland',
    'postImage': 'https://wallpaperaccess.com/thumb/4602804.jpg',
    'likes': 'Liked by user1 and others',
    'caption': 'Best game ever..... #Car #draft',
    'time':'2 hours ago',
    'likesnumber':'203',
     'commentsnum':'5',
     'repost':'true'
  },
  {
    'username': 'game_hub',
    'profileImage': 'https://picsum.photos/id/1005/100/100',
    'location': 'Tokyo, Japan',
    'postImage': 'https://wallpaperaccess.com/thumb/4602806.jpg',
    'likes': 'Liked by user2 and others',
    'caption': 'Best offer! #GameandMore #Fun',
    'time':'12 hours ago',
     'likesnumber':'100',
     'commentsnum':'',
     'repost':'false'
  },
  {
    'username': 'foodielife',
    'profileImage': 'https://picsum.photos/id/1011/100/100',
    'location': 'New York',
    'postImage': 'https://wallpaperaccess.com/thumb/4602808.jpg',
    'likes': 'Liked by user3 and others',
    'caption': 'Tasty vibes only! #food #yum',
    'time':'2 days ago',
     'likesnumber':'440',
     'commentsnum':'6',
     'repost':'false'
  },
];


  UserService userService=UserService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updatedata();
  }
Future<void> updatedata() async {
  final pref=SharedPreferences.getInstance();
  final username = await userService.getusername() ?? "not available";
  setState(() {
    email=username??"not available";
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:Colors.white ,
      appBar: AppBar(
        backgroundColor:Colors.white ,
        leading: IconButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Fliter()));
        }, icon: Icon(Icons.add)),
        title: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("𝓘𝓷𝓼𝓽𝓪𝓰𝓻𝓪𝓶"),IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_down_outlined))],),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),
        ],
      ),
     body: SingleChildScrollView(
       child: Column(
            children: [
             Container(
  height: 110,
  padding: const EdgeInsets.symmetric(vertical: 8),
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: storesimage.length + 1, // +1 for "Add Story"
    itemBuilder: (context, index) {
      if (index == 0) {
        // First item: "Add Story"
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              HighlightCircle(
                label: 'Your Story',
                imagePath: 'https://picsum.photos/id/1001/300/300',
                useGradientBorder: false, // no gradient for "Add Story"
                size: 75,
              ),
              Positioned(
                bottom: 25,
                right: 0,
                child:
                 Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.transparent, width: 2),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        // Regular user stories
        final store = storesimage[index - 1];
        final username = usernames[index - 1];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: HighlightCircle(
            label: username,
            imagePath: store['image'],
            useGradientBorder: true,
            size: 75,
          ),
        );
      }
    },
  ),
),

           // Divider(thickness: 0.1,),
           Column(
  children: List.generate(posts.length, (index) {
    final post = posts[index];
    final nextPost = posts[(index + 1) % posts.length]; // avoids index out of range
    return PostCard(
      username: post['username'],
      profileImage: post['profileImage'],
      location: post['location'],
      postImage: post['postImage'],
      likes: post['likes'],
      caption: post['caption'],
      widget: OverlappingProfileCircles(
        imageUrl1: post['profileImage'],
        imageUrl2: nextPost['profileImage'], // ✅ next profile image
        size: 20,
        overlap: 10,
      ),
      time: post['time'],
      likesnumber: post['likesnumber'] ?? '',
      commentsnum: post['commentsnum'] ?? '',
    );
  }),
),
            // Column(
            //   children: posts.map((post) {
            //     return PostCard(
            //       username: post['username'],
            //       profileImage: post['profileImage'],
            //       location: post['location'],
            //       postImage: post['postImage'],
            //       likes: post['likes'],
            //       caption: post['caption'],
            //       widget: OverlappingProfileCircles(
            //             imageUrl1:  post['profileImage'],
            //            imageUrl2:  post['profileImage'],
            //            size: 20,
            //              overlap: 10,
            //              ), 
            //       time: post['time'],
            //       likesnumber: post['likesnumber']??'',
            //       commentsnum: post['commentsnum']??'',
            //     );
            //   }).toList(),
            // ),
            Column(
              children: [
                
              ],
            )
         ],
       ),
     ),

    );
  }
}
