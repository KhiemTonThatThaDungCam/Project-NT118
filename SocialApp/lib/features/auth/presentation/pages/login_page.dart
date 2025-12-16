import 'package:flutter/material.dart';
import 'package:social_app/features/auth/presentation/components/my_button.dart';

import '../components/my_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {



  // text controller
  final emailController = TextEditingController();
  final pwController = TextEditingController();




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
                // welcome back msg
                Text(
                  "Welcome back, you've been missed!",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ), // TextStyle
                ), // Text

                const SizedBox(height: 25),
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



                const SizedBox(height: 25),
                // login button
                MyButton(
                    onTap: () {},
                    text: "Login",
                ),



                const SizedBox(height: 50),
                Text(
                  "Not a member? Register now",
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
