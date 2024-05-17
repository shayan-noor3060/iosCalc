import 'package:flutter/material.dart';

class MyBotton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;
  const MyBotton({super.key,required this.title,  this.color = const Color(0xffa5a5a5),required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical : 12),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(child: Text(title,style: const TextStyle(color: Colors.white,fontSize: 20 ),)),
          ),
        ),
      ),
    );
  }
}