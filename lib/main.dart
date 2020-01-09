import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() async {
  Map data = await getAlldata();

  print("The Sunrise time is:" + data['results']['sunrise']);
  print("The Sunset time is:" + data['results']['sunset']);
  print("The Status is:" + data['status']);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text("Sunrise and Sunset"),
        backgroundColor: Colors.purple,
      ),
      drawer: Drawer(),
      body: Container(
        height: 1200.0,
        child: Stack(
          children: <Widget>[
            Container(
              height: 500.0,
              //width: MediaQuery.of(context).size.width,
              child: Image(
                image: AssetImage("asset/photo-150.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 50.0,
              child: Container(
                margin: EdgeInsets.all(10.0),
                height: 150.0,
                width: 340.0,
                color: Colors.purple,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Sunrise time:" + data['results']['sunrise'],
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),

                    Text("Sunset time:" + data['results']['sunset'],
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),


                    SizedBox(
                      height: 10.0,
                    ),

                    Text("solar noon:" + data['results']['solar_noon'],
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ));
}

Future<Map> getAlldata() async {
  var api = "https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400";

  var data = await http.get(api);

  var jsonData = json.decode(data.body);

  return jsonData;
}
