import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/features/auth/presentation/cubits/auth_cubit.dart';
import '../components/my_drawer.dart';



class HomePage extends StatefulWidget{
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // build UI
  @override
  Widget build (BuildContext context) {

    // scaffold
    return Scaffold(
      // app bar
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home"),
      ),


      //drawer
      drawer: const MyDrawer(),
    );
  }
}