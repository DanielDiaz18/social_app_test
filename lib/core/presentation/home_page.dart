import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:social_app/user/application/user_bloc.dart';
import 'package:social_app/user/presentation/user_avatar.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final userState = context.watch<UserBloc>().state;
    return LoadingOverlay(
      isLoading: userState is UserStateLoading,
      progressIndicator: const CircularProgressIndicator.adaptive(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Feed'),
          actions: [
            if (userState is UserStateLoaded)
              IconButton(
                icon: UserAvatar(avatar: userState.user.avatar),
                onPressed: () {
                  context.push('/profile');
                },
              )
          ],
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
