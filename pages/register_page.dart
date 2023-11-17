import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../components/square_tile.dart';
import '../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key,
  required this.showLoginPage,
  }) : super(key: key);

  @override
  State <RegisterPage> createState() =>  _RegisterPageState();
}

class  _RegisterPageState extends State <RegisterPage> {
 // text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  void dispose() {
     // text controllers
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  Future signUp() async {
    // authenticate user
    if(passwordConfirmed()) {

      showDialog(
      context: context, 
      builder: (context){
        return const Center(child: CircularProgressIndicator());
      },
    ); 

    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(), 
      password: passwordController.text.trim()
      );

    Navigator.of(context).pop();  

      //add user details
      addUserDetails(
        firstNameController.text.trim(), 
        lastNameController.text.trim(), 
        emailController.text.trim(),
        );
    }
  }

  Future addUserDetails(String firstName, String lastName, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'First Name': firstName,
      'Last Name': lastName,
      'Email': email,
    });
  }

  bool passwordConfirmed() {
    if (passwordController.text.trim() == 
        confirmPasswordController.text.trim()) {
      return true;
    } 
    else {
      return false;
    }
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
              const SizedBox(height: 5),

              // logo
              const Icon(
                Icons.food_bank,
                size: 100,
              ),

              const SizedBox(height: 15),

              // Hello Again!
              Text(
                'Hello There!',
                style: GoogleFonts.bebasNeue(
                  fontSize: 52
                ),
              ),

              const SizedBox(height: 2),

              // welcome back, you've been missed!
              Text(
                'Register below with your details!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // first name textfield
              MyTextField(
                controller: firstNameController,
                hintText: 'First Name',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // last tname textfield
              MyTextField(
                controller: lastNameController,
                hintText: 'Last Name',
                obscureText: false,
              ),

              const SizedBox(height: 10),

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

              const SizedBox(height: 10),

              // confirm password textfield
              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // sign in button
              MyButton(
                text: "SIGN UP",
                onTap: signUp,

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

              const SizedBox(height: 15),

              // google + apple sign in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  // google button
                  SquareTile(
                    onTap: () => AuthService().signInWithGoogle(),
                    imagePath: 'lib/images/google.png'),

                  const SizedBox(width: 20),

                  // apple button
                  SquareTile(
                    onTap: () {},
                    imagePath: 'lib/images/apple.png')
                ],
              ),

              const SizedBox(height: 15),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),

                  const SizedBox(width: 4),
                  
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: const Text(
                    'Login now',
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


