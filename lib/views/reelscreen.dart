import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:instagram/widgets/highlightcircle.dart';
import 'package:instagram/widgets/verlappingprofilecircles%20.dart';

final List<Map<String, dynamic>> tagimages = List.generate(
  20,
  (index) => {
    'image': 'https://picsum.photos/id/${index + 10}/300/300',
     'isinterested': (index + 1) % 3 == 0,                            
  },
);
final List<Map<String, String>> userDetails = [
  {'username': 'alic_e', 'location': 'Paris, France', 'music': 'Sunflower – Post Malone'},
  {'username': 'bob', 'location': 'New York, USA', 'music': 'Blinding Lights – The Weeknd'},
  {'username': 'charlie', 'location': 'Tokyo, Japan', 'music': 'Peaches – Justin Bieber'},
  {'username': 'david', 'location': 'London, UK', 'music': 'Levitating – Dua Lipa'},
  {'username': 'emma', 'location': 'Sydney, Australia', 'music': 'As It Was – Harry Styles'},
  {'username': 'frank', 'location': 'Toronto, Canada', 'music': 'Happier Than Ever – Billie Eilish'},
  {'username': 'grace', 'location': 'Los Angeles, USA', 'music': 'Calm Down – Rema'},
  {'username': 'harry', 'location': 'Berlin, Germany', 'music': 'Shape of You – Ed Sheeran'},
  {'username': 'isla', 'location': 'Dublin, Ireland', 'music': 'Dance Monkey – Tones and I'},
  {'username': 'jack', 'location': 'Amsterdam, Netherlands', 'music': 'Stay – The Kid LAROI'},
  {'username': 'kate', 'location': 'Rome, Italy', 'music': 'Ghost – Justin Bieber'},
  {'username': 'leo', 'location': 'Barcelona, Spain', 'music': 'Perfect – Ed Sheeran'},
  {'username': 'mia', 'location': 'Bangkok, Thailand', 'music': 'Heat Waves – Glass Animals'},
  {'username': 'nina', 'location': 'Dubai, UAE', 'music': 'Flowers – Miley Cyrus'},
  {'username': 'oliver', 'location': 'Cape Town, South Africa', 'music': 'Someone Like You – Adele'},
  {'username': 'paul', 'location': 'Seoul, South Korea', 'music': 'Cupid – FIFTY FIFTY'},
  {'username': 'quinn', 'location': 'Mexico City, Mexico', 'music': 'Despacito – Luis Fonsi'},
  {'username': 'rose', 'location': 'Bali, Indonesia', 'music': 'Lover – Taylor Swift'},
  {'username': 'sam', 'location': 'Moscow, Russia', 'music': 'Believer – Imagine Dragons'},
  {'username': 'tina', 'location': 'Lisbon, Portugal', 'music': 'Counting Stars – OneRepublic'},
];

List<Map<String,dynamic>> likes=[
  {'likes':'10k' ,'comments':'250','repost':'25','share':'50','likedby':'Liked by alice and 10124 others'},
   {'likes':'25' ,'comments':'56','repost':'3','share':'50','likedby':'Liked by bob and 10124 others'},
    {'likes':'25k' ,'comments':'','repost':'','share':'50','likedby':'Liked by charlie and 10124 others'},
 {'likes':'250k' ,'comments':'250','repost':'25','share':'50','likedby':'Liked by david and 10124 others'},
 {'likes':'1M' ,'comments':'500','repost':'100','share':'150','likedby':'Liked by emma and 10124 others'},
 {'likes':'5k' ,'comments':'150','repost':'15','share':'30','likedby':'Liked by frank and 10124 others'},
 {'likes':'750' ,'comments':'75','repost':'7','share':'20','likedby':'Liked by grace and 10124 others'},
 {'likes':'2M' ,'comments':'1000','repost':'200','share':'300','likedby':'Liked by harry and 10124 others'},
 {'likes':'300' ,'comments':'30','repost':'3','share':'10','likedby':'Liked by isla and 10124 others'},
 {'likes':'15k' ,'comments':'200','repost':'20','share':'40','likedby':'Liked by jack and 10124 others'},
 {'likes':'800' ,'comments':'80','repost':'8','share':'15','likedby':'Liked by kate and 10124 others'},
 {'likes':'60k' ,'comments':'500','repost':'50','share':'70','likedby':'Liked by leo and 10124 others'},
 {'likes':'120' ,'comments':'12','repost':'1','share':'5','likedby':'Liked by mia and 10124 others'},
 {'likes':'900k' ,'comments':'800','repost':'80','share':'120','likedby':'Liked by nina and 10124 others'},
 {'likes':'45k' ,'comments':'400','repost':'40','share':'60','likedby':'Liked by oliver and 10124 others'},
 {'likes':'3M' ,'comments':'1500','repost':'300','share':'400','likedby':'Liked by paul and 10124 others'},
 {'likes':'700' ,'comments':'70','repost':'7','share':'10','likedby':'Liked by quinn and 10124 others'},
 {'likes':'20k' ,'comments':'' ,'repost':'' ,'share':'' ,'likedby':'Liked by rose and 10124 others'},
 {'likes':'' ,'comments':'' ,'repost':'' ,'share':'' ,'likedby':''},
 {'likes':'' ,'comments':'' ,'repost':'' ,'share':'' ,'likedby':''}
 ];
final List<Map<String, String>> natureCaptions = [
  // Short & Aesthetic
  {"category": "Short & Aesthetic", "caption": "Where the earth smiles in flowers. 🌸"},
  {"category": "Short & Aesthetic", "caption": "Lost in nature, found in peace. 🍃"},
  {"category": "Short & Aesthetic", "caption": "Breathe in the wild air. 🌲"},
  {"category": "Short & Aesthetic", "caption": "Let the forest whisper to your soul. 🌳"},
  {"category": "Short & Aesthetic", "caption": "Mother Nature never goes out of style. 🌎"},

  // Poetic & Calm
  {"category": "Poetic & Calm", "caption": "Every leaf is a love letter from the earth. 🍂"},
  {"category": "Poetic & Calm", "caption": "The sky painted its own masterpiece today. ☁️"},
  {"category": "Poetic & Calm", "caption": "When you listen closely, nature sings softly. 🕊️"},
  {"category": "Poetic & Calm", "caption": "Between every two pines, there is a doorway to a new world."},
  {"category": "Poetic & Calm", "caption": "Silence speaks loudest among the trees. 🌲"},

  // Playful & Modern
  {"category": "Playful & Modern", "caption": "Current mood: chasing sunsets. 🌅"},
  {"category": "Playful & Modern", "caption": "Vitamin D + tree therapy. ☀️🌿"},
  {"category": "Playful & Modern", "caption": "Keep calm and go outside. 🌾"},
  {"category": "Playful & Modern", "caption": "Green is my happy color. 💚"},
  {"category": "Playful & Modern", "caption": "Out of office: exploring planet Earth. 🌍"},
];

class Reelscreen extends StatefulWidget {
  const Reelscreen({super.key});

  @override
  State<Reelscreen> createState() => _ReelscreenState();
}

class _ReelscreenState extends State<Reelscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: tagimages.length,
          itemBuilder: (context, index) {
            final item = tagimages[index];
            final captions=natureCaptions[index];
            final likeinfo=likes[index];
            final userinfo=userDetails[index];
            return Stack(
              children: [
                // 📸 Background image
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.network(
                    item['image'],
                    fit: BoxFit.cover,
                  ),
                ),
               Row(
                children: [
                  
                   Icon(Icons.add,color: Colors.white,size: 30,),
                    SizedBox(width:70),
                   Text("Reels",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                   Icon(Icons.keyboard_arrow_down_rounded,color: Colors.white,weight: 0.1,),
                    SizedBox(width:10),
                   Text("Friends",style: TextStyle(color: Colors.grey[400],fontSize: 20,),),
                    SizedBox(width:5),
                            OverlappingProfileCircles(
                            imageUrl1: "https://i.pravatar.cc/300?img=5",
                           imageUrl2: "https://i.pravatar.cc/300?img=6",
                         
                           size: 20,
                             overlap: 10,
                             ),
                ],
               ),
                // 🎯 Right-side icons
                Positioned(
                  right: 10,
                  bottom: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children:  [
                          IconButton(onPressed: (){
                            Colors.red;
                          }, icon:  Icon(Icons.favorite_border,
                              color: Colors.white, size: 32),),
                         
                          SizedBox(height: 4),
                          Text(likeinfo['likes'],
                              style: TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children:  [
                          Icon(Icons.chat_bubble_outline,
                              color: Colors.white, size: 28),
                          SizedBox(height: 4),
                          Text(likeinfo['comments'],
                              style: TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          Transform.rotate(
                            angle: 335 * math.pi / 180,
                            child: const Icon(Icons.send,
                                color: Colors.white, size: 26),
                          ),
                          const SizedBox(height: 4),
                           Text(likeinfo['share'],
                              style: TextStyle(color: Colors.white, fontSize: 12)),
                              SizedBox(height: 4),
                               Icon(Icons.repeat, color: Colors.white, size: 28),
                          SizedBox(height: 4),
                          Text(likeinfo['repost'],
                              style: TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Icon(Icons.more_vert, color: Colors.white, size: 26),
                      
                    ],
                  ),
                ),
      
                // 🧩 Bottom column (user info + buttons)
                Positioned(
                  left: 10,
                  right: 10,
                  bottom: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                      // User info row
                     Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    // Avatar
    CircleAvatar(
      backgroundImage: NetworkImage(item['image']),
      radius: 14,
      backgroundColor: Colors.white54,
    ),
    const SizedBox(width: 8),

    // Username + location/music (flexible area)
    Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userinfo['username']!,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              // Location + music text (truncates if too long)
              SizedBox(
  width: 180, // limits text width
  child: Text(
    '📍 ${userinfo['location']} • 🎵 ${userinfo['music']}',
    style: const TextStyle(color: Colors.white70, fontSize: 12),
    overflow: TextOverflow.ellipsis,
  ),
),
              //const SizedBox(width: 8),

              // Follow button stays inline
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                  side: const BorderSide(color: Colors.white, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                ),
                child: const Text(
                  "Follow",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ],
),
      
                      const SizedBox(height: 10),
      
                      // Caption
                       Row(
                         children: [
                           Text(
                           captions['caption']!,
                            style: TextStyle(color: Colors.white, fontSize: 14),),
                            Spacer(),
                            Container(height: 30,width:30,decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://picsum.photos/id/1011/100/100"))),),
                         ],
                       ),
                       Row(mainAxisAlignment: MainAxisAlignment.start,children: [
                         Center(
                           child: OverlappingProfileCircles(
                        imageUrl1: "https://i.pravatar.cc/300?img=5",
                       imageUrl2: "https://i.pravatar.cc/300?img=6",
                       size: 20,
                         overlap: 10,
                         ),  ),      
                         SizedBox(width: 8,),
                          Text(likeinfo['likedby']!,style: TextStyle(color: Colors.white,fontSize: 12),)
                       ],),
                       SizedBox(height: 5,),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: TweenAnimationBuilder<double>(
                           tween: Tween<double>(begin: 0, end: 1),
                            duration: const Duration(seconds: 10), 
                            builder: (context, value, child) {
                              return FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: value,
                                 child: Container(
                                         height: 2,
                           color: Colors.white30,
                   ),
              );
           },
            ),
            ),
      
      
                      const SizedBox(height: 10),
                   if (item['isinterested'] == true)
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 30,
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white24,
                              foregroundColor: Colors.white,
                              shadowColor: Colors.transparent,
                              elevation: 0,
                              side: const BorderSide(
                                  color: Colors.white, width: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                            child: const Text(
                              "Not Interested",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white24,
                              foregroundColor: Colors.white,
                              shadowColor: Colors.transparent,
                              elevation: 0,
                              side: const BorderSide(
                                  color: Colors.white, width: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                            child: const Text(
                              "Interested",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                     
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
  
}
