import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance Tracker App',
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('Attendance Tracker App')),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}