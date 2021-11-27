
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListAlphaHeader extends StatelessWidget {
  final String text;

  const ListAlphaHeader({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 4.0),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
