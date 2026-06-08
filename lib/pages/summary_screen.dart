// ignore_for_file: deprecated_member_use, unused_import

import 'package:attendance_tracker_app/provider/attendance_provider.dart';
import 'package:attendance_tracker_app/utils/summary_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context, listen: false);
    final total = provider.students.length;

    return Scaffold(
      backgroundColor:  Color(0xFFE9F0F6),
      appBar: AppBar(
        title: const Text(
          'Attendance Summary',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SummaryWidget(
                    title: 'Present',
                    count: provider.presentCount,
                    total: total,
                    baseColor: Colors.green,
                  ),
                  SummaryWidget(
                    title: 'Absent',
                    count: provider.absentCount,
                    total: total,
                    baseColor: Colors.red,
                  ),
                ],
              ),
              const SizedBox(height: 32),
          
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Present Students:',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                  
                      Text(
                        provider.presentStudents.isEmpty
                            ? '(None)'
                            : '(${provider.presentStudents.map((s) => s.name).join(', ')})',
                        style: const TextStyle(color: Colors.black87),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Absent Students:',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        provider.absentStudents.isEmpty
                            ? '(None)'
                            : '(${provider.absentStudents.map((s) => s.name).join(', ')})',
                        style: const TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
