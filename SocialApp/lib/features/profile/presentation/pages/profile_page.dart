import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/features/auth/domain/entities/app_user.dart';
import 'package:social_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_app/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:social_app/features/profile/presentation/cubits/profile_states.dart';

class ProfilePage extends StatefulWidget {

  final String uid;


  const ProfilePage({super.key, required this.uid});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  // cubits
  late final authCubit = context.read<AuthCubit>();
  late final profileCubit = context.read<ProfileCubit>();

  // current user
  late AppUser? currentUser = authCubit.currentUser;



  @override
  void initState(){
    super.initState();

    // load user profile data
    profileCubit.fetchUserProfile(widget.uid);
  }


  // build ui
  @override
  Widget build (BuildContext context)
  {
    // scaffold
    return BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          // loaded
          if (state is ProfileLoaded) {
            return Scaffold(
              // app bar
              appBar: AppBar(
                title: Text(currentUser!.email),
                foregroundColor: Theme.of(context).colorScheme.primary,
              ),

              // body
            );
          }




          else if (state is ProfileLoading){
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return const Center(child: Text("No profile found."),);
          }
        }
    );
  }
}
