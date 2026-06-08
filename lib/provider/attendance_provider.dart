import 'package:flutter/material.dart';

class Student {
  final String id;
  final String name;
  bool isPresent;

  Student({
    required this.id,
    required this.name,
    this.isPresent = false,
  });
}

class AttendanceProvider with ChangeNotifier {
  // Static list of 10 students as requested
  final List<Student> _students = List.generate(
    10,
    (index) => Student(id: '$index', name: 'Student ${index + 1}'),
  );

  List<Student> get students => _students;

  // Counts computed dynamically
  int get presentCount => _students.where((Student s) => s.isPresent).length;
  int get absentCount => _students.length - presentCount;

  List<Student> get presentStudents => _students.where((Student s) => s.isPresent).toList();
  List<Student> get absentStudents => _students.where((Student s) => !s.isPresent).toList();

  // Check attendance for a student --------------------------------
  void toggleAttendance(int index) {
    _students[index].isPresent = !_students[index].isPresent;
    notifyListeners();
  }
}
