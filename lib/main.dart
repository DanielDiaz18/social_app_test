import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/presentation/app.dart';
import 'package:social_app/injection.dart';
import 'package:social_app/user/application/user_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configInjection();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => getIt<UserBloc>()..add(UserEventGet()),
        ),
      ],
      child: const App(),
    ),
  );
}
