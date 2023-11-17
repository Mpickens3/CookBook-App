import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:classico/components/my_button.dart';
import 'package:classico/components/my_textfield.dart';
import 'package:classico/components/square_tile.dart';
import 'package:classico/services/auth_service.dart';
import 'forgot_password_page.dart'; 
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
   final VoidCallback showRegisterPage;
  
   const LoginPage({Key? key,
     required this.showRegisterPage,
   }) : super(key: key);
  
   @override
   State<LoginPage> createState() => _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage> {
     // text controllers
     final emailController = TextEditingController();
     final passwordController = TextEditingController();
    
     Future signIn() async {
       //loading circle
       showDialog(
         context: context, 
         builder: (context){
           return Center(child: CircularProgressIndicator());
       },
     );
       
     await FirebaseAuth.instance.signInWithEmailAndPassword(
       email: emailController.text.trim(), 
       password: passwordController.text.trim(),
     );
       
     // pop the loading circle
     Navigator.of(context).pop();
     }
    
     @override
     void dispose() {
       emailController.dispose();
       passwordController.dispose();
       super.dispose();
     }
    
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         backgroundColor: Colors.grey[300],
         body: SafeArea(
           child: Center(
             child: SingleChildScrollView(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 const SizedBox(height: 25),
                 
                 // logo
                 const Icon(
                   Icons.food_bank,
                   size: 100,
                 ),
                 
                 const SizedBox(height: 15),
                 
                 // Hello Again!
                 Text(
                   'Hello Again!',
                   style: GoogleFonts.bebasNeue(
                   fontSize: 52
                 ),
               ),
                 
               // welcome back, you've been missed!
               Text(
                 'Welcome back, you\'ve been missed!',
                 style: TextStyle(
                   color: Colors.grey[700],
                   fontWeight: FontWeight.bold,
                   fontSize: 16,
                 ),
                ),
                 
                const SizedBox(height: 25),
                 
                 // email textfield
                 MyTextField(
                   controller: emailController,
                   hintText: 'Email',
                   obscureText: false,
                 ),
                 
               const SizedBox(height: 10),
                 
               // password textfield
               MyTextField(
                 controller: passwordController,
                 hintText: 'Password',
                 obscureText: true,
               ),
                 
               SizedBox(height: 10),
                 
               // forgot password?
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     GestureDetector(
                       onTap: () {
                         Navigator.push(
                           context, 
                           MaterialPageRoute(
                             builder: (context) {
                               return forgotPasswordPage();
                             },
                           ),
                         );
                        },
                     child: Text(
                       'Forgot Password?',
                       style: TextStyle(
                         color: Colors.blue, 
                         fontWeight: FontWeight.bold,
                       ),
                     )
                     ),
                   ],
                 ),
                ),
                 
                 SizedBox(height: 25),
                         
                 // sign in button
                 MyButton(
                   text: "Sign In",
                   onTap: signIn,
                 ),
                 
                 const SizedBox(height: 25),
                 
                 // or continue with
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                         Expanded(
                           child: Divider(
                           thickness: 0.5,
                           color: Colors.grey[400],
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 10.0),
                           child: Text(
                             'Or continue with',
                             style: TextStyle(color: Colors.grey[700]),
                           ),
                         ),
                         Expanded(
                           child: Divider(
                             thickness: 0.5,
                             color: Colors.grey[400],
                           ),
                         ),
                     ],
                    ),
                  ),
                 
                   const SizedBox(height: 50),
                 
                   // google + apple sign in buttons
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       // google button
                       SquareTile(
                         onTap: () => AuthService().signInWithGoogle(),
                         imagePath: 'lib/images/google.png'),
                       
                       SizedBox(width: 25),
                       
                       // apple button
                       SquareTile(
                         onTap: () {},
                         imagePath: 'lib/images/apple.png')
                     ],
                   ),
                 
                   const SizedBox(height: 50),
                           
                   // not a member? register now
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(
                         'Not a member?',
                         style: TextStyle(
                           color: Colors.grey[700],
                         ),
                       ),
                       
                       const SizedBox(width: 4),
                       
                       GestureDetector(
                         onTap: widget.showRegisterPage,
                         child: const Text(
                           'Register now',
                           style: TextStyle(
                             color: Colors.blue,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                       ),
                     ],
                   ),
                ]
         )
       ),
     ),
   )
   );
   }
}
