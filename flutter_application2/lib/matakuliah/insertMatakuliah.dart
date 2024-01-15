// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InsertMatakuliah extends StatefulWidget {
  const InsertMatakuliah({super.key});

  @override
  State<InsertMatakuliah> createState() => _InsertMatakuliahState();
}

class _InsertMatakuliahState extends State<InsertMatakuliah> {
  final kode = TextEditingController();
  final nama = TextEditingController();
  final sks = TextEditingController();

  bool isNumeric(String str) {
    // ignore: unnecessary_null_comparison
    if (str == null || str.isEmpty) {
      return false;
    }
    final format = RegExp(r'^[0-9]+$');
    return format.hasMatch(str);
  }

  Future<void> insertMatakuliah() async {
    if (isNumeric(sks.text)) {
      String urlInsert = "http://192.168.26.152:9005/api/v1/matakuliah";
      final Map<String, dynamic> data = {
        "kode": kode.text,
        "nama": nama.text,
        "sks": int.parse(sks.text)
      };

      try {
        var response = await http.post(Uri.parse(urlInsert),
            body: jsonEncode(data),
            headers: {'Content-Type': 'application/json'});

        if (response.statusCode == 200) {
          Navigator.pop(context);
        } else {
          print("Gagal");
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Bukan Angka");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insert Data Matakuliah"),
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
                  labelText: "Kode",
                  hintText: "Ketikkan Kode Matakuliah",
                  prefixIcon: Icon(Icons.code),
                ),
                controller: kode,
              ),
              SizedBox(height: 10),
              TextField(
                controller: nama,
                decoration: InputDecoration(
                  labelText: "Nama",
                  hintText: "Ketikkan Nama Matakuliah",
                  prefixIcon: Icon(Icons.book),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: sks,
                decoration: InputDecoration(
                  labelText: "SKS",
                  hintText: "Ketikkan Jumlah SKS",
                  prefixIcon: Icon(Icons.numbers_rounded),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  insertMatakuliah();
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