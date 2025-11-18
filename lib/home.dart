import 'package:flutter/material.dart';
import 'package:instagram/service/user_service.dart';
import 'package:instagram/widgets/highlightcircle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  List<Map<String, dynamic>> likes = [
    {'likes': '10k', 'comments': '250', 'repost': '25', 'share': '50'},
    {'likes': '25', 'comments': '56', 'repost': '3', 'share': '50'},
    {'likes': '25k', 'comments': '120', 'repost': '10', 'share': '20'},
    {'likes': '250k', 'comments': '250', 'repost': '25', 'share': '50'},
    {'likes': '1M', 'comments': '500', 'repost': '100', 'share': '150'},
    {'likes': '5k', 'comments': '150', 'repost': '15', 'share': '30'},
    {'likes': '750', 'comments': '75', 'repost': '7', 'share': '20'},
    {'likes': '2M', 'comments': '1000', 'repost': '200', 'share': '300'},
    {'likes': '300', 'comments': '30', 'repost': '3', 'share': '10'},
    {'likes': '15k', 'comments': '200', 'repost': '20', 'share': '40'},
  ];

  UserService userService = UserService();
  String email = "";

  @override
  void initState() {
    super.initState();
    updatedata();
  }

  Future<void> updatedata() async {
    final username = await userService.getusername() ?? "not available";
    setState(() {
      email = username;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Instagram"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),

      body: Column(
        children: [

          // ---------------- STORIES ----------------
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: storesimage.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HighlightCircle(
                    label: usernames[index],
                    imagePath: storesimage[index]['image'],
                    useGradientBorder: true,
                    size: 75,
                  ),
                );
              },
            ),
          ),

          // ---------------- POSTS ----------------
          Expanded(
            child: ListView.builder(
              itemCount: storesimage.length,
              itemBuilder: (context, index) {
                final post = storesimage[index];
                final u = userDetails[index];
                final like = likes[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // ------- Post Header -------
                    ListTile(
                      leading: HighlightCircle(
                        label: '',
                        imagePath: post['image'],
                        useGradientBorder: true,
                        size: 45,
                      ),
                      title: Text(u['username']!),
                      subtitle: Text("📍 ${u['location']} • 🎵 ${u['music']}"),
                      trailing: Icon(Icons.more_vert),
                    ),

                    // ------- Post Image -------
                    Image.network(
                      post['image'],
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),

                    // ------- Buttons -------
                    Row(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
                        Text(like['likes']),
                        SizedBox(width: 16),
                        IconButton(onPressed: () {}, icon: Icon(Icons.mode_comment_outlined)),
                        Text(like['comments']),
                        Spacer(),
                        IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border)),
                      ],
                    ),

                    // ------- Likes -------
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "${like['likes']} likes",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                    Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
