import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Result Screen",
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "place holder",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              fontFamily: "Lato",
            ),
          ),
          SizedBox(
            height: 100,
            width: double.infinity,
          ),
          ElevatedButton(
            onPressed: null,
            child: Text(
              "Restart Quiz",
              style: TextStyle(
                fontSize: 20,
                color: Colors.amber[800],
              ),
            ),
          )
        ],
      ),
    );
  }
}
