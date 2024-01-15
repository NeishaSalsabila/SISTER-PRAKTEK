

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateMatakuliah extends StatefulWidget {
  int idup;
  String kodeup;
  String namaup;
  String sksup;
  UpdateMatakuliah(this.idup, this.kodeup, this.namaup, this.sksup);

  @override
  State<UpdateMatakuliah> createState() => _UpdateMatakuliahState();
}

class _UpdateMatakuliahState extends State<UpdateMatakuliah> {
  int id = 0;
  final kode = TextEditingController();
  final nama = TextEditingController();
  final sks = TextEditingController();

  @override
  void initState() {
    kode.text = widget.kodeup;
    nama.text = widget.namaup;
    sks.text = widget.sksup;
    id = widget.idup;

    super.initState();
  }

  bool isNumeric(String str) {
    // ignore: unnecessary_null_comparison
    if (str == null || str.isEmpty) {
      return false;
    }
    final format = RegExp(r'^[0-9]+$');
    return format.hasMatch(str);
  }

  Future<void> updateMatakuliah() async {
    if (isNumeric(sks.text)) {
      String urlUpdate =
          "http://192.168.26.152:9005/api/v1/matakuliah/${id}";
      try {
        var response = await http.put(
          Uri.parse(urlUpdate),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            "kode": kode.text,
            "nama": nama.text,
            "sks": sks.text,
          })
        );

        if (response.statusCode == 200) {
          Navigator.pop(context);
        } else {
          print(response.statusCode);
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
        title: Text("Update Data Matakuliah"),
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
                  updateMatakuliah();
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