import 'package:flutter/material.dart';

class Coba extends StatefulWidget {
  const Coba({super.key});

  @override
  State<Coba> createState() => _CobaState();
}

class _CobaState extends State<Coba> {
  List<Map<String, dynamic>> namaMahasiswa = [];
  List<Map<String, dynamic>> namaMatakuliah = [];
  List listNilai = [];

  @override
  void initState() {
    super.initState();
    // Add any initialization code here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tugas Sister'),
      ),
      body: Center(
        child: Text(
          'Tugas Sister',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}