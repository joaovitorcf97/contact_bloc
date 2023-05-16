import 'package:contact_bloc/features/bloc_example/bloc/example_bloc.dart';
import 'package:contact_bloc/features/bloc_example/bloc_example.dart';
import 'package:contact_bloc/features/bloc_example/bloc_freezed_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/bloc_example/bloc_freezed/example_freezed_bloc.dart';
import 'home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (_) => const HomePage(),
        '/example/bloc': (_) => BlocProvider(
              create: (_) => ExampleBloc()..add(ExampleFindNameEvent()),
              child: const BlocExample(),
            ),
        '/bloc/example/freezed': (_) => BlocProvider(
              create: (_) => ExampleFreezedBloc()
                ..add(
                  const ExampleFreezedEvent.findNames(),
                ),
              child: const ExamplaeFreezed(),
            ),
      },
    );
  }
}
