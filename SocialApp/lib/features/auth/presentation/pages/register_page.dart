import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/features/auth/presentation/cubits/auth_cubit.dart';
import '../components/my_button.dart';
import '../components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? togglePages;
  const RegisterPage({super.key, required this.togglePages});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text controller
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPwController = TextEditingController();

  // register button pressed
  void register(){
    // info
    final String name = nameController.text;
    final String email = emailController.text;
    final String pw = pwController.text;
    final String confirmPw = confirmPwController.text;

    // auth cubit
    final authCubit = context.read<AuthCubit>();

    // auth cubit
    if (email.isNotEmpty &&
        name.isNotEmpty &&
        pw.isNotEmpty &&
        confirmPw.isNotEmpty) {
          // ensure pw match
          if (pw == confirmPw){
            authCubit.register(name, email, pw);
          }

          // pw don't match
          else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Password don't match!!!")));
          }
        }
    // empty error
    else {
     ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(content: Text("Please complete all fields!!!")));
    }
  }

@override
  void dispose() {
  nameController.dispose();
  emailController.dispose();
  pwController.dispose();
  confirmPwController.dispose();
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
                  onTap: register,
                  text: "Register",
                ),



                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member?",
                      style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                    ),
                    GestureDetector(
                      onTap: widget.togglePages,
                      child: Text(
                        " Login now",
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