import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  const AdaptiveButton({
    required this.text,
    required this.handler,
    super.key,
  });

  final String text;
  // VoidCallback and void Function() work as the same
  final VoidCallback handler;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: handler,
            color: Colors.purple,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        : ElevatedButton(
            onPressed: handler,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          );
  }
}
