
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_application2/mahasiswa/insertMahasiswa.dart';
import 'package:flutter_application2/mahasiswa/updateMahasiswa.dart';
import 'package:flutter_application2/nilai/nilaiMahasiswa.dart';

class DataMahasiswa extends StatefulWidget {
  const DataMahasiswa({super.key});

  @override
  State<DataMahasiswa> createState() => _DataMahasiswaState();
}

class _DataMahasiswaState extends State<DataMahasiswa> {
  List listMahasiswa = [];

  @override
  void initState() {
    allMahasiswa();
    super.initState();
  }

  Future<void> allMahasiswa() async {
    String urlMahasiswa = "http://192.168.26.152:9008/api/v1/mahasiswa";
    try {
      var response = await http.get(Uri.parse(urlMahasiswa));
      listMahasiswa = jsonDecode(response.body);
      setState(() {
        listMahasiswa = jsonDecode(response.body);
      });
    } catch (exc) {
      print(exc);
    }
  }

  Future<void> deleteMahasiwa(int id) async {
    String urlMahasiswa = "http://192.168.26.152:9008/api/v1/mahasiswa/${id}";
    try {
      await http.delete(Uri.parse(urlMahasiswa));
      setState(() {
        allMahasiswa();
      });
    } catch (exc) {
      print(exc);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Data Mahasiswa",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InsertMahasiswa()))
                    .then((value) => allMahasiswa());
              },
              icon: Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
      body: listMahasiswa.isEmpty
          ? Center(
              child: Text(
                'Tidak ada data',
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: listMahasiswa.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(5),
                  child: ListTile(
                    leading: Icon(
                      Icons.person_2_outlined,
                      color: Colors.indigo,
                      size: 24,
                    ),
                    title: Text(
                      listMahasiswa[index]["nama"]?.toString() ?? "",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Email : ${listMahasiswa[index]["email"]?.toString() ?? ""}\nTanggal Lahir : ${listMahasiswa[index]["tgllahir"]?.toString() ?? ""}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.normal),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            tooltip: "Hapus Data",
                            onPressed: () {
                              deleteMahasiwa(listMahasiswa[index]["id"]);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red.shade300,
                              size: 24,
                            )),
                        IconButton(
                            tooltip: "Edit Data",
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)  {
                                return UpdateMahasiswa(
                                    listMahasiswa[index]["id"] ?? "",
                                    listMahasiswa[index]["nama"] ?? "",
                                    listMahasiswa[index]["email"] ?? "",
                                    DateTime.parse(
                                        listMahasiswa[index]["tgllahir"]));
                              })).then((value) => allMahasiswa());
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.blue,
                              size: 24,
                            )),
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
