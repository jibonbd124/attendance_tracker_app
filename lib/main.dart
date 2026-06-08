import 'package:attendance_tracker_app/pages/attendance_screen.dart';
import 'package:attendance_tracker_app/provider/attendance_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AttendanceProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance Tracker App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor:Color(0xFFEAF1F7),
          foregroundColor: Colors.black,
        ),
        scaffoldBackgroundColor: const Color(0xFFEAF1F7),
      ),
      home: const AttendanceScreen(),
    );
  }
}