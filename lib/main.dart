import 'dart:convert';
//import 'package:/json_serialization/sem_auto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_serialization/sem.dart';
//for running project use sem.dart and comment sem_auto.dart

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Json Serialization")),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: decodeJson, child: Text("decode")),
              SizedBox(height: 10),
              ElevatedButton(onPressed: encodeJson, child: Text("encode")),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> decodeJson() async {
    String userString = await rootBundle.loadString('assets/sem.json');
    Map<String, dynamic> semMap = await json.decode(userString);
    //using the map to print the values
    // debugPrint("Hello ${semMap['name']}");
    // debugPrint("Your Semester is ${semMap['sem']}");
    // debugPrint("Your Enrollment no is ${semMap['roll'].toString()}");

    //using the class
    Sem sem = Sem.fromJson(semMap);
    debugPrint("Hello ${sem.name}");
    debugPrint("Your semester is ${sem.sem}");
    debugPrint("Your Enrollment no is ${sem.roll.toString()}");
  }

  Future<void> encodeJson() async {
    Map<String, dynamic> userMap = {};
    // Map<String, dynamic> userMap = {
    //   "name": "Mohit",
    //   "sem": "8th",
    //   "roll": 180511301001,
    // };
    //String userString = json.encode(userMap);
    //using the map to print the values
    //debugPrint(userString);

    //using the class
    // Sem sem = Sem("Mohit", "8th", 180511301001);
    //uncomment the above line and comment the below line for sem_auto.dart
    Sem sem = Sem(name: "Mohit", sem: "8th", roll: 180511301001);
    userMap = sem.toJson();
    debugPrint(userMap.toString());
  }
}
