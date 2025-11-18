import 'package:flutter/material.dart';
import 'package:instagram/views/messgescreen2.dart';
import 'package:instagram/widgets/metaailogo.dart';

class Messagescreen extends StatefulWidget {
  const Messagescreen({super.key});

  @override
  State<Messagescreen> createState() => _MessagescreenState();
}

class _MessagescreenState extends State<Messagescreen> {
  final List<Map<String, dynamic>> msglist = [
    {
      'image': 'https://wallpaperaccess.com/thumb/4602806.jpg',
      'active': true,
      'username': 'Austin John',
      'subtitle': 'Hi.43m',
      'notification': true,
    },
    {
      'image': 'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
      'active': true,
      'username': 'Travel spots',
      'subtitle': 'Sent a reel by theburgerjun...2h',
      'notification': true,
    },
    {
      'image': 'https://wallpaperaccess.com/thumb/4602852.jpg',
      'active': false,
      'username': 'Max_drifts',
      'subtitle': '4 new messages.2h',
      'notification': true,
    },
    {
      'image': 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
      'active': true,
      'username': 'Amritha Haridas',
      'subtitle': '4+ new messages.2h',
      'notification': true,
    },
    {
      'image': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
      'active': false,
      'username': 'Ocgnx',
      'subtitle': 'Reacted to your messages.3h',
      'notification': false,
    },
     {
      'image': 'https://images.unsplash.com/photo-1517365830460-955ce3ccd263',
      'active': true,
      'username': 'LARA',
      'subtitle': 'Reacted to your messages.3d',
      'notification': false,
    },
    {
      'image': 'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d',
      'active': true,
      'username': 'Harry',
      'subtitle': 'Sent a reel by cafe-club...2h',
      'notification': false,
    },
    {
      'image': 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1',
      'active': true,
      'username': 'Robin',
      'subtitle': 'Missing you .until next time ',
      'notification': false,
    },
  ];
final List<Map<String, String>> imagelist = [
  {'image': 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e', 'label': 'true',  'icon': 'false', 'viewed': '120'},
  {'image': 'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d', 'label': 'false', 'icon': 'true',  'viewed': '230'},
  {'image': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb', 'label': 'false', 'icon': 'true',  'viewed': '150'},
  {'image': 'https://images.unsplash.com/photo-1506744038136-46273834b3fb', 'label': 'false', 'icon': 'true',  'viewed': '98'},
  {'image': 'https://images.unsplash.com/photo-1500534623283-312aade485b7', 'label': 'false', 'icon': 'true',  'viewed': '310'},
  {'image': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330', 'label': 'false', 'icon': 'true',  'viewed': '50'},
  {'image': 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1', 'label': 'false', 'icon': 'true',  'viewed': '180'},
  {'image': 'https://images.unsplash.com/photo-1517841905240-472988babdf9', 'label': 'false', 'icon': 'true',  'viewed': '240'},
  {'image': 'https://images.unsplash.com/photo-1520813792240-56fc4a3765a7', 'label': 'false', 'icon': 'true',  'viewed': '500'},
  {'image': 'https://images.unsplash.com/photo-1517365830460-955ce3ccd263', 'label': 'false', 'icon': 'true',  'viewed': '75'},
];
  final List<Map<String, String>> stories = [
    {
      'image': 'https://wallpaperaccess.com/thumb/4602806.jpg',
      'username': 'Gamers',
      'note': 'Good day'
    },
    {
      'image': 'https://wallpaperaccess.com/thumb/4602432.jpg',
      'username': 'Austin',
      'note': ' '
    },
    {
      'image': 'https://wallpaperaccess.com/thumb/4602852.jpg',
      'username': 'Max',
      'note': 'Have a good one'
    },
    {
      'image': 'https://wallpaperaccess.com/thumb/4602426.jpg',
      'username': 'Chris',
      'note': 'Never better'
    },

  ];
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit_note_sharp, color: Colors.black),
            ),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                "astro_boy",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(Icons.keyboard_arrow_down, color: Colors.black),
            ],
          ),
          centerTitle: true,
          
        ),
        body: Column(
          children: [
            Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const SizedBox(width: 8),
            Metaailogo(size: 20,),
            const SizedBox(width: 8),
            Expanded(
              child:TextField(
              decoration: InputDecoration(
                hintText: 'Ask Meta or Search',
                hintStyle:  TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
              style:const  TextStyle(color: Colors.white),
            ),
            ),
            const SizedBox(width: 8),
          ],
        )
      ),
            ),
        
            _buildNotesSection(),
            // const SizedBox(height: 3),
            // Divider(thickness: 0.5, color: Colors.grey.shade300),
            // const SizedBox(height: 5),
            // Row(
            //   children: const [
            //     Padding(
            //       padding: EdgeInsets.only(left: 12),
            //       child: Text(
            //         "Location off",
            //         style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //   ],
            // ),
            Expanded(
              child: ListView.separated(
                itemCount: msglist.length,
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final msg = msglist[index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Messgescreen2(),
            ),
          );
                    },
                    leading: Stack(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(msg['image']),
                          radius: 25,
                        ),
                        if (msg['active'])
                           Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.green[400],
                            ),
                          ),
                      ],
                    ),
                    title: Text(msg['username']),
                    subtitle: Text(
                      msg['subtitle'],
                      style: TextStyle(
                        fontWeight: msg['notification']
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (msg['notification'])
                          const Icon(Icons.circle, color: Colors.blueAccent, size: 10),
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.camera_alt_outlined),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotesSection() {
    return Container(
      height: 130,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // --- YOUR NOTE ---
          GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://wallpaperaccess.com/thumb/4602806.jpg',
                      ),
                    ),
                    Positioned(
                      top: -8,
                      right: -5,
                      child: Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Text(
                          "Hi 👋",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black87,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Text("Your note", style: TextStyle(fontSize: 12)),
                // const SizedBox(height: 6),
               Row(
              children:  [
                Icon(Icons.star,color: Colors.red[300],size: 15,),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    "Location off",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
               
              ],
            ),
          ),
          const SizedBox(width: 15),

          // --- FRIENDS' NOTES ---
          for (var story in stories)
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(story['image']!),
                      ),
                      Positioned(
                        top: -8,
                        right: -5,
                        child: Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            story['note']!,
                            style:  TextStyle(
                                fontSize: 10, color: Colors.black,),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(story['username']!,
                      style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
