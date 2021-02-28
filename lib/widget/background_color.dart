import 'package:flutter/material.dart';

class BackGroundColor extends StatelessWidget {
  MaterialColor color;
  Widget child;
  BackGroundColor({this.color, this.child});
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [color.shade600, color.shade300, color.shade100],
            stops: [0.6, 0.8, 1],
            begin: AlignmentDirectional.topEnd,
            end: AlignmentDirectional.bottomCenter),
      ),
    );
  }
}
