import 'package:flutter/material.dart';
import 'package:instagram/service/user_service.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  UserService userService=UserService();  @override
  Widget build(BuildContext context) {
   return Drawer(
      backgroundColor: Colors.white, // Instagram dark theme style
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            // Header
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children:  [
                   IconButton(onPressed:(){ Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black),),
                 SizedBox(width: 10,),
              Text("Settings and activity",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
                ],
              ),
            ),

            // Account Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text(
                'Account',
                style: TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline, color: Colors.black),
              title: const Text('Edit Profile', style: TextStyle(color: Colors.black)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.lock_outline, color: Colors.black),
              title: const Text('Privacy', style: TextStyle(color: Colors.black)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.notifications_none, color: Colors.black),
              title: const Text('Notifications', style: TextStyle(color: Colors.black)),
              onTap: () {},
            ),

            const Divider(color: Colors.grey),

            // Support Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text(
                'Support',
                style: TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.help_outline, color: Colors.black),
              title: const Text('Help', style: TextStyle(color: Colors.black)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Colors.black),
              title: const Text('About', style: TextStyle(color: Colors.black)),
              onTap: () {},
            ),

            const Divider(color: Colors.grey),

            // Log out
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.black),
              title: const Text('Log Out', style: TextStyle(color: Colors.black)),
              onTap: () {
                // Add your logout logic here
              },
            ),
          ],
        ),
      ),
    );
  }
}
// drawer: Drawer(
      //  child: Column(
      //   children: [
      //     DrawerHeader(child:Container(
      //       child: Column(
      //         children: [
      //       Row(children: [
      //         IconButton(onPressed: (){ Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black),),
      //         SizedBox(width: 10,),
      //         Text("Settings and activity",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
      //       ],),
      //       TextField(
      //         decoration: InputDecoration(
      //           hintText: 'Search',
      //           hintStyle:  TextStyle(color: Colors.grey),
      //           prefixIcon: const Icon(Icons.search, color: Colors.black87),
      //           filled: true,
      //           fillColor: Colors.grey[200],
      //           border: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(12),
      //             borderSide: BorderSide.none,
      //           ),
      //         ),
      //         style:const  TextStyle(color: Colors.white),
      //       ),
      //       Row(children: [
      //         Expanded(child: Text("Your account",style: TextStyle(color: Colors.white10,),)),
      //         Flexible(child:Image.asset("assets/images/logo_meta.png",height:150 ,width: 200,))
      //       ],),
      //       ListTile(
      //         leading:Icon(Icons.person_outline_sharp, color: Colors.black),
      //         title: Text("Account Centre"),
      //         subtitle: Text("Paasword,security,personal details, ad\n perfernces"),
      //         trailing: Icon(Icons.arrow_forward_ios),
      //         )
      //         ],
      //       ),
      //     ))
      //   ],
      //  ),
      // ),
