import 'package:flutter/material.dart';
class HeadTitle extends StatelessWidget {
   HeadTitle({Key? key,required this.text}) : super(key: key);
String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        alignment: Alignment.topLeft,
        child: Text(text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
