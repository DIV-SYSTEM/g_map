import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/form_data.dart';
import 'screens/form_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FormData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Address Form App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FormScreen(),
    );
  }
}
