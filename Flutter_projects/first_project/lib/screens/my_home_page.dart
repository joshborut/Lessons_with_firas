import 'package:first_project/widgets/question.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(
          width: double.infinity,
          child: Text(
            "Starter App",
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 50,
            ),
            color: Colors.blue,
            child: const Text("Hello World"),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Dog"),
              SizedBox(width: 100),
              Text("Dog"),
            ],
          ),
          const Question()
        ],
      ),
    );
  }
}
