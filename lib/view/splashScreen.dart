import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
              'https://raw.githubusercontent.com/Pushpendra1001/Memeopolis/main/memelogo.png'),
          // SizedBox(
          //   height: 30,
          // ),
          // Text(
          //   "Memeopolis",
          //   style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          // )
        ],
      ),
    );
  }
}
