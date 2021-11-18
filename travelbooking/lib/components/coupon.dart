import 'package:flutter/material.dart';

class Coupon extends StatelessWidget {
  final String title;
  final String subtitle;
  const Coupon({
    Key? key, required this.title, required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 32),
      width: 250,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Icon(Icons.image, color: Colors.white,),
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                  style: TextStyle(
                      fontWeight: FontWeight.w900
                  ),
                ),
                Text(subtitle,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey
                  ),
                )
              ],
            ),
            SizedBox(width: 8,)
          ],
        ),
        elevation: 2,
      ),
    );
  }
}
