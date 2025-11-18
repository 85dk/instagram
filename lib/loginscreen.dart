import 'package:flutter/material.dart';
import 'package:instagram/forgotpassword_screen.dart';
import 'package:instagram/page_movement.dart';
import 'package:instagram/views/homescreen.dart';
import 'package:instagram/registrationscreen.dart';
import 'package:instagram/service/user_service.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  List<String>counteries=["English(India)","English(Uk)","English(Us)"];
  String selected="English(India)";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  UserService userService=UserService();
  bool obscureText=true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<String>(
                elevation: 10,
                value: selected,icon: Icon(Icons.keyboard_arrow_down_rounded,color: Colors.white70,),onChanged: (String? data) {
                 setState(() {
                    selected=data!;
                 });
                },items: counteries.map<DropdownMenuItem<String>>((String? item){
                  return DropdownMenuItem(value: item,child: Text("$item"));
                }).toList()
                ),
                Container(
                  height: 200,
                  width: 200,
                  child: Center(
                  child: Image.asset( "assets/images/instagram1.png",height: 80,width: 80,
                                ),
                         ),
                  ),
                SizedBox(height: 10,),
                TextFormField(
                 controller: email,
                 keyboardType: TextInputType.emailAddress,
                 decoration: InputDecoration(
                  hintText: 'Username,email address or mo....',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300, width: 1)
                  )
                 ),
                validator: (value) {
                    if (value == null || value.isEmpty) {
                     return 'Please enter your username or email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8,),
                 TextFormField(
                 controller: password,
                 keyboardType: TextInputType.visiblePassword,
                 obscureText: true,
                 decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(onPressed: (){
                    obscureText=!obscureText;
                    setState(() {});
                  }, icon:obscureText? Icon(Icons.visibility_off):Icon(Icons.visibility)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300, width: 1)
                  )
                 ),
                 validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8,),
                 OutlinedButton(
                   style: OutlinedButton.styleFrom(
                     fixedSize: const Size(250, 50),
                  foregroundColor: Colors.white,       // Text & icon color
                  backgroundColor: Colors.blueAccent,
                  side: BorderSide(color: Colors.blueAccent),       // Button background color
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 0,  // No shadow by default
                   ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      //_formKey.currentState!.save();
                      await userService.saveuserdata(username: email.text.trim(), password: password.text.trim());
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PageMovement()));
                      print('Email: $email, Password: $password');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Login successful')),
                      );
                    }
                  },
                  child: const Text('Login in'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){return ForgotpasswordScreen();}));
                  },
                  child: Text("Forgotten password?",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),)),
                SizedBox(height:100,),
                OutlinedButton(
                onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => Registrationscreen()));
                 },
           style: OutlinedButton.styleFrom(
             fixedSize: const Size(250, 35), // button size
             foregroundColor: Colors.blueAccent, 
             backgroundColor:Colors.white ,// text color
             side: const BorderSide(color: Colors.blueAccent,width: 1), // border color
             shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(20),
           ),
           textStyle: const TextStyle(
           fontWeight: FontWeight.bold,
         fontSize: 16,
          ),
          ),
          child: const Text("Create new account"),
           ),
           SizedBox(width: 50,),
           Opacity(opacity: 0.5,
            child: Image.asset("assets/images/logo_meta.png",height:50 ,width: 100,fit: BoxFit.cover,))
            ],
          ),
        ),
      ),
    );
  }
}