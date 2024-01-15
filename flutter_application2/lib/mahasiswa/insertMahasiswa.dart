// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InsertMahasiswa extends StatefulWidget {
  const InsertMahasiswa({super.key});

  @override
  State<InsertMahasiswa> createState() => _InsertMahasiswaState();
}

class _InsertMahasiswaState extends State<InsertMahasiswa> {
  final nama = TextEditingController();
  final email = TextEditingController();
  String namaMhs = "";
  String emailMhs = "";
  DateTime tglLahir = DateTime.now();

  Future<void> _pilihTgl(BuildContext context) async {
    final DateTime? kalender = await showDatePicker(
      context: context,
      initialDate: tglLahir,
      firstDate: DateTime(1950),
      lastDate: DateTime(2030),
    );

    if (kalender != null && kalender != tglLahir) {
      setState(() {
        tglLahir = kalender;
      });
    }
  }

  Future<void> insertMahasiswa() async {
    String urlInsert = "http://192.168.26.152:9008/api/v1/mahasiswa";
    final Map<String, dynamic> data = {
      "nama": namaMhs,
      "email": emailMhs,
      "tgllahir": '${tglLahir.toLocal()}'.split(' ')[0]
    };

    try {
      var response = await http.post(Uri.parse(urlInsert),
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        Navigator.pop(context, "berhasil");
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insert Data Mahasiswa"),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(16),
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Nama",
                  hintText: "Masukkan Nama",
                  prefixIcon: Icon(Icons.text_fields),
                ),
                controller: nama,
              ),
              SizedBox(height: 10),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Masukkan Email",
                  prefixIcon: Icon(Icons.email_rounded),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Tanggal Lahir",
                  hintText: "Pilih Tanggal Lahir",
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () => _pilihTgl(context),
                controller: TextEditingController(
                  text: "${tglLahir.toLocal()}".split(" ")[0],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    namaMhs = nama.text;
                    emailMhs = email.text;
                  });
                  insertMahasiswa();
                },
                child: Text('SIMPAN'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}