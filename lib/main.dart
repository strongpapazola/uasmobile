import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './kasir.dart';
import './dokter.dart';

void main() {
  runApp(MaterialApp(
    title: "Rumah Sakit Apps",
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

// make base variable
String baseUrl = "http://192.168.8.165";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rumah Sakit Apps"),
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    child: Center(
                      child: ElevatedButton(
                        onPressed: ()=>Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context)=> Kasir(),
                          ),
                        ), 
                        child: Text("Reservasi"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          textStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Center(
                      child: ElevatedButton(
                        onPressed: ()=>Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context)=> Dokter(),
                          ),
                        ), 
                        child: Text("Dokter"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          textStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
