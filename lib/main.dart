// ignore_for_file: unused_import, prefer_const_constructors_in_immutables, prefer_const_constructors, unnecessary_string_interpolations, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import './config.dart';
import './model/data.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Table()));
}

class Table extends StatefulWidget {
  Table({Key? key}) : super(key: key);

  @override
  State<Table> createState() => _TableState();
}

class _TableState extends State<Table> {
  List<RowData> data1 = [];
  List<dynamic> temp = [];
  Future<List<RowData>> getdata() async {
    var db = Mysql();
    await db.getconnection().then((conn) {
      String fetch = 'Select * from tempdata';
      conn.query(fetch).then((user) {
        for (var row in user) {
          temp.add(row);
        }
      });
    });
    List<dynamic> t = jsonDecode(temp);
    data1 = t.map((t) =>RowData.fromJson(t)).toList();
    return data1;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
          child: FutureBuilder(
        future: getdata(),
        builder: (context, comingdata) {
          if (comingdata == null) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount: comingdata.data.toString().length,
              itemBuilder: (context, int index) {
                return ListTile(
                  title: Text(comingdata.data[index].id.toString()),
                );
              },
            );
          }
        },
      )),
    );
  }
}
