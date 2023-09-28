import 'package:flutter/material.dart';

void main() {
  runApp(
    const Column(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Widget 1',
          textDirection: TextDirection.ltr,
          style: TextStyle(backgroundColor: Colors.green, fontSize: 30.0),
        ),
        Text(
          'Widget 2',
          textDirection: TextDirection.ltr,
          style: TextStyle(backgroundColor: Colors.green, fontSize: 30.0),
        ),
        Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Widget 3',
              textDirection: TextDirection.ltr,
              style: TextStyle(backgroundColor: Colors.red, fontSize: 30.0),
            ),
            Text(
              'Widget 4',
              textDirection: TextDirection.ltr,
              style: TextStyle(backgroundColor: Colors.red, fontSize: 30.0),
            ),
          ],
        )
      ],
    ),
  );
}
