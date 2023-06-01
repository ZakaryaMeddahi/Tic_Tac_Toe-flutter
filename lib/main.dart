import 'package:flutter/material.dart';
import 'components/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 38),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: const [
              SizedBox(
                height: 60,
              ),
              Text(
                'Tic Tac Toe Game',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 120,
              ),
              Box()
            ],
          )
        )
      )
    );
  }
}