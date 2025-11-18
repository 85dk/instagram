import 'package:flutter/material.dart';
import 'package:instagram/views/profile/create.dart';
import 'package:instagram/views/profile/logout.dart';
import 'package:instagram/views/profile/post.dart';
import 'package:instagram/views/profile/reels.dart';
import 'package:instagram/views/profile/repost.dart';
import 'package:instagram/views/profile/settings.dart';
import 'package:instagram/views/profile/tags.dart';
import 'package:instagram/widgets/InstagramReelsIcon.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<Profilescreen> with TickerProviderStateMixin {
  late final TabController _tabController;
  List<Widget> pages=[Post(),Reels(),Repost(),Tags()];
   final scaffoldkey=GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldkey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Create()));
          },
          icon:  Icon(Icons.add, color: Colors.black),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.lock_outline, size: 18, color: Colors.black),
            SizedBox(width: 5),
            Text(
              "astro_boy",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.keyboard_arrow_down, color: Colors.black),
            SizedBox(width: 5,),
            Icon(Icons.circle,color: Colors.red,size: 10,),
            SizedBox(width: 10,),
           Text("@",
           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // scaffoldkey.currentState!.openDrawer();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Logout()));
            },
            icon: const Icon(Icons.menu, color: Colors.black),
          ),
        ],
        elevation: 0,
      ),
      

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🧍 Profile Header
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //HighlightCircle(label: "", imagePath: 'assets/images/logo_meta.png',useGradientBorder: true,),
                Stack(
                  alignment: AlignmentGeometry.bottomRight,
                  children: [
                        const CircleAvatar(
                    radius: 40,
                    backgroundImage:NetworkImage('https://picsum.photos/id/1001/300/300')   //AssetImage('assets/images/logo_meta.png',), // replace with your image
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                     child: Container(
                     decoration: BoxDecoration(
                    color: Colors.black,
                     shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                         width: 2, // white border to separate from image
                      ),
                    ),
                 padding: const EdgeInsets.all(4),
                  child: ClipOval(
                child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 12,
              ),
            ),
          ),
        ),

                  ],
                  
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                   
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [  Text(
                          "Jack Daneil",
                           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                       ),
                             ],
                      ),
                      const SizedBox(height: 4),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("60", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text("496", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text("557", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Posts"),
                          Text("Followers"),
                          Text("Following"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // 🧾 Bio Section
            const Text(
              "Be the one you are.\nYou make choices and don't look back.\nWe move forward with your choice.",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 6),
            const Text(
              "@thisis_derry",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),

            const SizedBox(height: 12),

            // ⚙️ Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      foregroundColor: Colors.black,
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10)
                      )
                    ),
                    onPressed: () {},
                    child: const Text("Edit profile", style: TextStyle(fontWeight: FontWeight.bold,),maxLines: 1,),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                       foregroundColor: Colors.black,
                       side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10)
                      )
                    ),
                    onPressed: () {},
                    child: const Text("Share Profile", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 8),
              
                const SizedBox(width: 8),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10)
                      ),
                    side: BorderSide.none,
                  ),
                  onPressed: () {},
                  child: const Icon(Icons.person_add_outlined, color: Colors.black),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Row(children: [
               Container(
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                         color: Colors.white,
                       border: Border.all(color: Colors.black45, width: 2),
                       ),
                    padding: const EdgeInsets.all(16),
                      child: Icon(Icons.add)),
                       SizedBox(width: 20),
                        highlightItem( "https://picsum.photos/id/1001/300/300"),
                           const SizedBox(width: 20),
                        highlightItem( "https://picsum.photos/id/1001/300/300"),
                     SizedBox(width: 20),
                      highlightItem( "https://picsum.photos/id/1001/300/300"),
                      SizedBox(width: 15),
                      highlightItem( "https://picsum.photos/id/1001/300/300"),
              //CircleAvatar(radius: 30,),SizedBox(width: 20,),CircleAvatar(radius: 30,),SizedBox(width: 20),CircleAvatar(radius: 30,),SizedBox(width: 20),CircleAvatar(radius: 30,),SizedBox(width: 20),CircleAvatar(radius: 30,),
              ],
              ),
            const SizedBox(height: 20),
            SingleChildScrollView(
  scrollDirection: Axis.vertical,
  child: Row(
    children: [
      Text("New", style: const TextStyle(fontSize: 12)),
      const SizedBox(width: 55),
      Text("Travel", style: const TextStyle(fontSize: 12)),
      const SizedBox(width: 55),
      Text("Food", style: const TextStyle(fontSize: 12)),
      const SizedBox(width: 55),
      Text("Friends", style: const TextStyle(fontSize: 12)),
      const SizedBox(width: 50),
      Text("Life", style: const TextStyle(fontSize: 12)),
    ],
  ),
),
            const SizedBox(height: 20),



            // 🏷️ Tabs Section
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.black,
                indicatorWeight: 2,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
              
                indicatorSize: TabBarIndicatorSize.tab,
              
                tabs: const [
                  Tab(icon: Icon(Icons.grid_on)),
                  Tab(icon: InstagramReelsIcon(size:20,color: Colors.grey,)),
                  Tab(icon: Icon(Icons.compare_arrows_rounded)),
                  Tab(icon: Icon(Icons.person_pin_outlined)),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 📜 Tab Views
            SizedBox(
              height: 400,
              child: TabBarView(
                controller: _tabController,
                children:pages
               
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget highlightItem( String imagePath) {
  return Column(
    children: [
      Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey, width: 2),
        ),
        child: ClipOval(
          child:Image.network(imagePath) //Image.asset(imagePath, fit: BoxFit.cover),
        ),
      ),
     
    ],
  );
}
Widget _buildrawer(){
  return EndDrawerButton(
    
  );
}
}
