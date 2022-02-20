// ignore_for_file: unused_import, prefer_const_constructors_in_immutables, prefer_const_constructors

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
  List data = [];

  

  @override
  void initState() {
    super.initState();
    var db = Mysql();
    db.getconnection().then((conn) {
      String fetch = 'Select * from tempdata';
      conn.query(fetch).then((user) {
        setState(() {
          for (var row in user) {
            data.add(row);
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children:data.map((info){
              return ListView(
                children: [
                  ListTile(
                    title: Text("${info[0]} - ${info[1]} ${info[2]}"),
                    subtitle: Text("${info[3]}"),
                  )
                ],
                
              );
            }).toList()
          ),
        ),
      ),
    );
  }
}
