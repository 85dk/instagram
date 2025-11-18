import 'package:flutter/material.dart';
import 'package:instagram/loginscreen.dart';
import 'package:instagram/service/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  UserService userService=UserService();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){ Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.black87),),
        title:Text("Settings and activity",style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),) ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               TextField(
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
                Row(children: [
                  Expanded(child: Text("Your account",style: TextStyle(color: Colors.black87,fontSize: 14,),maxLines: 1,)),
                  SizedBox(width: 200,),
                  Flexible(child:Image.asset("assets/images/logo_meta.png",height:80 ,width: 80,))
                ],),
                 ListTile(
                  leading:Icon(Icons.person_outline_sharp, color: Colors.black),
                  title: Text("Account Centre"),
                  subtitle: Text("Paasword,security,personal details, ad\n perfernces"),
                  trailing: Icon(Icons.arrow_forward_ios,size: 20,color: Colors.black54,),
                  ),
                  Row(
                    children: [
                      Text("Manage your connected experience and account settings\nacross Meta technologies.",style: TextStyle(color: Colors.black87,fontSize: 14,),),
                      //TextButton(onPressed: (){}, child: Text("Learn more",style: TextStyle(color: Colors.blueAccent),),)
                    ],
                  ),
                  Divider(thickness: 4,color: Colors.grey[200],),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("How you use Instagram",style: TextStyle(color: Colors.black87,fontSize: 14,),),
                  ),
                   ListTile(
                  leading: const Icon(Icons.bookmark_border, color: Colors.black),
                  title: const Text('Saved', style: TextStyle(color: Colors.black)),
                  trailing:const Icon(Icons.arrow_forward_ios_rounded,size: 20,color: Colors.black54,) ,
                  onTap: () {},
                ),
                 ListTile(
                  leading: const Icon(Icons.timelapse_sharp, color: Colors.black),
                  title: const Text('Arichive', style: TextStyle(color: Colors.black)),
                  trailing:const Icon(Icons.arrow_forward_ios_rounded,size: 20,color: Colors.black54,) ,
                  onTap: () {},
                ),
                 ListTile(
                  leading: const Icon(Icons.auto_graph, color: Colors.black),
                  title: const Text('Your activity', style: TextStyle(color: Colors.black)),
                  trailing:const Icon(Icons.arrow_forward_ios_rounded,size: 20,color: Colors.black54,) ,
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.notifications_none, color: Colors.black),
                  title: const Text('Notification', style: TextStyle(color: Colors.black)),
                  trailing:const Icon(Icons.arrow_forward_ios_rounded,size: 20,color: Colors.black54,) ,
                  onTap: () {},
                ),
                 ListTile(
                  leading: const Icon(Icons.access_time_rounded, color: Colors.black),
                  title: const Text('Time management', style: TextStyle(color: Colors.black)),
                  trailing:const Icon(Icons.arrow_forward_ios_rounded,size: 20,color: Colors.black54,) ,
                  onTap: () {},
                ),
                Divider(thickness: 4,color: Colors.grey[200],),
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
                onTap: () async {
                  userService.logout();
                 Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Loginscreen()));
                },
              ),
          
          
          
            ],
          ),
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
