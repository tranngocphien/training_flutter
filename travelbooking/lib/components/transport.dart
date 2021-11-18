import 'package:flutter/material.dart';

class Transport extends StatelessWidget {
  final String name;
  final IconData icon;
  final MaterialColor color;
  const Transport({
    Key? key, required this.name, required this.icon, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Icon(icon, color: Colors.white,),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(height: 8,),
        Text(name,
          style: const TextStyle(
              fontSize: 16,
              color: Colors.grey
          ),
        )
      ],
    );
  }
}