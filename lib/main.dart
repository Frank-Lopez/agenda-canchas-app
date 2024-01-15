import 'package:agenda_canchas_app/src/presentation/pages/myApp/bloc/my_app_bloc.dart';
import 'package:agenda_canchas_app/src/presentation/pages/myApp/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyAppBloc(),
      child: const MaterialApp(
        home: MyAppPage(),
      ),
    );
  }
}