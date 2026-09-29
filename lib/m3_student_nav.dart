import 'package:flutter/material.dart';

class Student {
  final String name;
  final String rollNo;
  final int marks;
  Student(this.name, this.rollNo, this.marks);
}

class M3HomeScreen extends StatelessWidget {
  const M3HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final student = Student("John Doe", "CS101", 85);
    return Scaffold(
      appBar: AppBar(title: const Text("Student Nav")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => M3DetailScreen(student: student)),
            );
          },
          child: const Text("Send Student Data"),
        ),
      ),
    );
  }
}

class M3DetailScreen extends StatelessWidget {
  final Student student;
  const M3DetailScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Details")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name: ${student.name}"),
            Text("Roll No: ${student.rollNo}"),
            Text("Marks: ${student.marks}"),
          ],
        ),
      ),
    );
  }
}
