import 'package:flutter/material.dart';
import 'package:instagram/loginscreen.dart';

class ForgotpasswordScreen extends StatefulWidget {
  const ForgotpasswordScreen({super.key});

  @override
  State<ForgotpasswordScreen> createState() => _ForgotpasswordScreenState();
}

class _ForgotpasswordScreenState extends State<ForgotpasswordScreen> {
  TextEditingController username=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context){return Loginscreen();}));}, icon: Icon(Icons.arrow_back)),
        ),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Find your account",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            Text("Enter your email address or \nusername",style: TextStyle(fontWeight: FontWeight.w600),),
            InkWell(onTap: () {},child: Text("Can't reset your password?",style: TextStyle(color: Colors.blue[700],fontWeight: FontWeight.w500),)),
            SizedBox(height: 5,),
             TextFormField(
                   controller: username,
                   keyboardType: TextInputType.visiblePassword,
                   decoration: InputDecoration(
                    hintText: 'Email address or username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1)
                    )
                   ),
                   validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      if (value.length < 2) {
                        return 'Password must be at least 2 characters long';
                      }
                      return null;
                    },
                  ),
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
                  , child: Text("Continue")),
                  SizedBox(height: 5,),
                  Center(child: Text("Search by mobile number insta...",style: TextStyle(fontSize: 14,color: Colors.black87,fontWeight: FontWeight.w600),)),
                  Row(children: [
                  Expanded(child: Divider()),
                  Text("OR",style: TextStyle(fontSize: 14,color: Colors.black45),),
                  Expanded(child: Divider()),
                  ],),
                  SizedBox(height: 5,),
                  ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48), 
                  shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                  foregroundColor:Colors.black87,
                  backgroundColor: Colors.white,
                  side: BorderSide(
                    width: 1,
                    color: Colors.black26,  
                  )
                  )
                  , child: Text("Log In With facebook")),
                  Expanded(child: Spacer())
          ],),
        ) ,
      ),
    );
  }
}