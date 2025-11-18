import 'package:flutter/material.dart';
import 'package:instagram/views/feedscreen.dart';
import 'package:instagram/views/homescreen.dart';
import 'package:instagram/views/messagescreen.dart';
import 'package:instagram/views/profilescreen.dart';
import 'package:instagram/views/reelscreen.dart';
import 'package:instagram/views/searchscreen.dart';
import 'package:instagram/widgets/InstagramReelsIcon.dart';
import 'package:instagram/widgets/highlightcircle.dart';

class PageMovement extends StatefulWidget {
  const PageMovement({super.key});

  @override
  State<PageMovement> createState() => _PageMovementState();
}

class _PageMovementState extends State<PageMovement> {
  int _selectedIndex = 0;
  bool reel=true;

  // Example pages for navigation
  final List<Widget> _pages = [Homescreen(),Reelscreen(),Messagescreen(),Searchscreen(),Profilescreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // keeps icons visible
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false, // Instagram hides text labels
        showUnselectedLabels: false,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
           const BottomNavigationBarItem(
            icon: Center( child: InstagramReelsIcon(size: 18,),),
            activeIcon:Center( child: InstagramReelsIcon(size: 18,color: Colors.black,),),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon:Stack(
  clipBehavior: Clip.none,
  children: [

    // Main Icon (rotated send)
    Transform.rotate(
      angle: 335 * 3.1415926535 / 180,
      child: const Icon(
        Icons.send,
        color: Colors.grey,
        size: 25,
      ),
    ),

    // Red dot bottom-right
    Positioned(
      bottom: 1,
      right: 1,
      child: Icon(
        Icons.circle,
        size: 8,
        color: reel ? Colors.red : Colors.white,
      ),
    ),
  ],
),
            activeIcon:  Stack(
           clipBehavior: Clip.none,
              children: [

              // Main Icon (rotated send)
            Transform.rotate(
              angle: 335 * 3.1415926535 / 180,
           child: const Icon(
           Icons.send,
           color: Colors.black,
         size: 25,
       ),
      ),

    // Red dot bottom-right
    Positioned(
      bottom: -1,
      right: -1,
      child: Icon(
        Icons.circle,
        size: 8,
        color: reel ? Colors.red : Colors.white,
      ),
    ),
  ],
),

            label: 'Message',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
            label: 'Search',
          ),
           BottomNavigationBarItem(
            icon: Column(
              children: [
                 CircleAvatar(
                  radius: 12,
                  backgroundImage: NetworkImage('https://picsum.photos/id/1001/300/300'),)
              
              ],
            ),
            // icon: Icon(Icons.person_outline),
             activeIcon: Column(
              children: [
                Container(
 
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(color: Colors.black, width: 2),
  ),
  child: CircleAvatar(
                  radius: 12,
                  backgroundImage: NetworkImage('https://picsum.photos/id/1001/300/300'),)
)

               
                
              ],
            ),
             label: 'Profile',
          ),
        ],
      ),
    );
}
}