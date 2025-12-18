import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/features/auth/data/firebase_auth_repo.dart';
import 'package:social_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_app/features/auth/presentation/cubits/auth_states.dart';
import 'package:social_app/features/auth/presentation/pages/auth_page.dart';
import 'package:social_app/themes/light_mode.dart';

import 'features/home/presentation/pages/home_page.dart';



/*
APP - ROOT LEVEL


REPO: For the database
  - firebase

Bloc Providers: for state management
  - auth
  - profile
  - home
  - search
  - theme
Check Auth State
  - Auth -> login/register
*/



class MyApp extends StatelessWidget{



  // auth repo
  final authRepo = FirebaseAuthRepo();



  MyApp({super.key});

  @override
  Widget build (BuildContext context)
  {
      // provide cubit to app
      return BlocProvider(create: (context) => AuthCubit(authRepo: authRepo)..checkAuth(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightMode,
          home: BlocConsumer<AuthCubit, AuthState>(
            builder: (context, authState) {

              print(authState);


              if (authState is Unauthenticated) {
                return const AuthPage();
              }

              if (authState is Authenticated) {
                return const HomePage();
              }
              else {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },


            listener: (context, state) {
              if (state is AuthError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
                }
              }
            ,)
        ),
      );
  }
}