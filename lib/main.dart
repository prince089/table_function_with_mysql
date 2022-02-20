import 'package:flutter/material.dart';
import './config.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Table()));
}

class Table extends StatefulWidget {
  Table({Key? key}) : super(key: key);

  @override
  State<Table> createState() => _TableState();
}

class _TableState extends State<Table> {
  List data = []; // empty list
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var db = Mysql(); // sql config file

    db.getconnection().then((conn) {
      String fetch = 'Select * from tempdata'; // query 
      conn.query(fetch).then((user) {
        // data.add()
        for (var row in user) {
          data.add(row); // adding query in empty list
          // print(row);
        }
        // print working but orignal data not affecting 
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Text(data.toString()),
          ]),
        ),
      ),
    );
  }
}
