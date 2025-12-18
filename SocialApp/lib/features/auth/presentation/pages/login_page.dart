import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/features/auth/presentation/components/my_button.dart';

import '../components/my_text_field.dart';
import '../cubits/auth_cubit.dart';

class LoginPage extends StatefulWidget {

  final void Function()? togglePages;

  const LoginPage({super.key, required this.togglePages});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {



  // text controller
  final emailController = TextEditingController();
  final pwController = TextEditingController();

  // login button pressed
  void login ()
  {
    // prepare email & pw
    final String email = emailController.text;
    final String pw = pwController.text;

    // auth cubit
    final authCubit = context.read<AuthCubit>();

    // ensure that the email & pw fields are not empty
    if (email.isNotEmpty && pw.isNotEmpty) {
      // login!
      authCubit.login(email, pw);
    }

    // display error if some fields are empty
    else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please enter both email and password"))); // SnackBar
    }
  }


@override
  void dispose() {
    emailController.dispose();
    pwController.dispose();
    super.dispose();
  }



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
                    onTap: login,
                    text: "Login",
                ),



                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                    ),
                    GestureDetector(
                      onTap: widget.togglePages,
                      child: Text(
                        " Register now",
                        style:
                        TextStyle(color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
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
