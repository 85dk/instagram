import 'package:flutter/material.dart';
import 'package:instagram/views/homescreen.dart';
import 'package:instagram/loginscreen.dart';

class Registrationscreen extends StatefulWidget {
  const Registrationscreen({super.key});

  @override
  State<Registrationscreen> createState() => _RegistrationscreenState();
}

class _RegistrationscreenState extends State<Registrationscreen> {
  TextEditingController mobilenumber=TextEditingController();
  final GlobalKey<FormState> key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Scaffold(
         backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context){return Loginscreen();}));}, icon: Icon(Icons.arrow_back)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("What's your mobile \nnumber?",style: TextStyle(fontWeight: FontWeight.bold
              ,fontSize: 16),),
              Text("Enter the mobile number on which\nyou can be contacted.No one will\nsee this on your profile",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
              TextFormField(
                       controller: mobilenumber,
                       keyboardType: TextInputType.visiblePassword,
                       decoration: InputDecoration(
                        isDense: false,
                        hintText: 'Mobile number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300, width: 1)
                        )
                       ),
                       validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your mobile number';
                          }
                          if (value.length < 6) {
                            return 'Password must be 10 characters long';
                          }
                          return null;
                        },
                      ),
              SizedBox(height: 5,),        
              Text("You may receive WhatsApp and SMS\nnotifications from us for security and \nlogin purpose ",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16),),
              SizedBox(height: 5,),
                      ElevatedButton(onPressed: (){},
                      style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48), 
                      shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            ),
                      foregroundColor:Colors.white,
                      backgroundColor: Colors.blue.shade700
                      )
                      , child: Text("Next")),
                      SizedBox(height: 8,),
                      ElevatedButton(onPressed: (){if(key.currentState!.validate()){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));

                      }},
                      style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48), 
                      shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(20),
                            ),
                      foregroundColor:Colors.black87,
                      backgroundColor: Colors.white,
                      side: const BorderSide(
                      color: Colors.black26,                         // border color
                       width: 1,                                   // 👈 border thickness
                      ),
                      )
                      , child: Text("Sign up with email address")),
                      Spacer(),
              Center(child: InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Loginscreen()));
              },child: Text("I already have an accounts",style: TextStyle(color: Colors.blue[700],fontWeight: FontWeight.w500),))),
            
              ],
            ),
          ),
      ),
    );
  }
}