import 'package:flutter/material.dart';
import 'package:flutter_application2/coba.dart';
import 'package:flutter_application2/mahasiswa/mahasiswa.dart';
import 'package:flutter_application2/matakuliah/matakuliah.dart';
import 'package:flutter_application2/nilai/nilai.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application'),
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildFeatureButton(
              context,
              'Data Mahasiswa',
              Icons.person,
              DataMahasiswa(),
            ),
            SizedBox(height: 10),
            _buildFeatureButton(
              context,
              'Data Matakuliah',
              Icons.book,
              DataMatakuliah(),
            ),
            SizedBox(height: 10),
            _buildFeatureButton(
              context,
              'Data Nilai',
              Icons.star,
              DataNilai(),
            ),
            SizedBox(height: 10),
            _buildFeatureButton(
              context,
              'Data Coba',
              Icons.star,
              Coba(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureButton(
    BuildContext context,
    String buttonText,
    IconData icon,
    Widget destinationPage,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.indigo,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(150, 40),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 200, // Tambahkan properti maxWidth di sini
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 25,
            ),
            SizedBox(width: 10),
            Text(
              buttonText,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
