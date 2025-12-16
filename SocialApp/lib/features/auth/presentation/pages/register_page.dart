import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
// text controller
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPwController = TextEditingController();




  // BUILD UI
  @override
  Widget build(BuildContext context) {
    // SCAFFOLD
    return Scaffold(
      // BODY
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Icon(
                  Icons.lock_open_rounded,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ), // // Icon

                const SizedBox(height: 50),
                // create account message
                Text(
                  "Let's create an account for you",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ), // TextStyle
                ), // Text


                const SizedBox(height: 25),
                // name text field
                MyTextField(
                  controller: nameController,
                  hintText: "Name",
                  obscureText: false,
                ),






                const SizedBox(height: 10),
                // email text field
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),



                const SizedBox(height: 10),
                // pw text field
                MyTextField(
                  controller: pwController,
                  hintText: "Password",
                  obscureText: true,
                ),


                const SizedBox(height: 10),
                // confirm pw text field
                MyTextField(
                  controller: confirmPwController,
                  hintText: "Confirm password",
                  obscureText: true,
                ),


                const SizedBox(height: 25),
                // register button
                MyButton(
                  onTap: () {},
                  text: "Register",
                ),



                const SizedBox(height: 50),
                Text(
                  "Already a member? Login now",
                  style:
                  TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                // not a member ? register now
              ],
            ),
          ), // // Column
        ), // // Center
      ), // // SafeArea
    ); // // Scaffold
  }
}