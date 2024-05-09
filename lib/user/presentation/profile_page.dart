import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/user/application/user_bloc.dart';
import 'package:social_app/user/presentation/user_avatar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final state = context.watch<UserBloc>().state;
    final user = state.user;
    if (user == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('User profile'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 225,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Image.network(
                    user.cover!,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox.square(
                          dimension: 150,
                          child: UserAvatar(avatar: user.avatar),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 70),
                              Text(
                                user.name,
                                style: textTheme.titleMedium,
                              ),
                              Text(user.email),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
