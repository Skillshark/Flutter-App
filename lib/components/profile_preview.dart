import 'package:flutter/material.dart';

class profilePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage('images/profile.jpg')),
      ),
    );
  }
}
