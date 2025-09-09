import 'package:flutter/material.dart';

class BackColorLeft extends StatelessWidget {
  const BackColorLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.purple.withOpacity(0.4),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.5),
            blurRadius: 200,
            spreadRadius: 150,
          )
        ],
      ),
    );
  }
}

class BackColorRight extends StatelessWidget {
  const BackColorRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red.withOpacity(0.4),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.5),
            blurRadius: 200,
            spreadRadius: 150,
          )
        ],
      ),
    );
  }
}
