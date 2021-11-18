import 'package:flutter/material.dart';

class Place extends StatelessWidget {
  final String image;
  final String name;
  final String location;
  final String numberOfStar;
  const Place({
    Key? key, required this.image, required this.name, required this.location, required this.numberOfStar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 240,
        width: 200,
        margin: EdgeInsets.only(right: 16),
        padding: EdgeInsets.only(left: 16, bottom: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red,
            image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.white,size: 20,),
                        Text(location,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600
                          ),

                        )
                      ],
                    )

                  ],
                ),
                Icon(Icons.star, color: Colors.yellow,),
                Text(numberOfStar,
                  style: TextStyle(
                      fontSize: 18, color: Colors.white, fontWeight: FontWeight.w800
                  ),
                )

              ],
            )
          ],
        )

    );
  }
}
