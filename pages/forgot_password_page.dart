import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:classico/components/my_textfield.dart';

class forgotPasswordPage extends StatefulWidget {
  const forgotPasswordPage({super.key});

  @override
  State<forgotPasswordPage> createState() => _forgotPasswordPageState();
}

class _forgotPasswordPageState extends State<forgotPasswordPage> {

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try{ 
    await FirebaseAuth.instance
      .sendPasswordResetEmail(email: emailController.text.trim());
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          content: Text('Password reset link sent! Check your email.'),
        );
      },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Enter Your Email and we will send you a password reset link',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),

          const SizedBox(height: 10),

        // email textfield
          MyTextField(
            controller: emailController,
            hintText: 'Email',
            obscureText: false,
          ),

          const SizedBox(height: 10),

         MaterialButton(
          onPressed: passwordReset,
          child: Text(
            'Reset Password'
          ), 
          color: Colors.green,
        )   
      
      ],)
    );
  }
}