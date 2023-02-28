import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[300],
            ),
            onPressed: () {},
            child: Text(
              "Restart Quiz",
              style: TextStyle(
                fontSize: 20,
                color: Colors.lightBlue[300],
              ),
            ),
          )
        ],
      ),
    );
  }
}
