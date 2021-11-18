import 'package:flutter/material.dart';

import 'components/coupon.dart';
import 'components/place.dart';
import 'components/transport.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_back,
                size: 28,
              ),
              SizedBox(height: 16,),
              Text("Book tickets",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transport(name: "Flight", icon: Icons.flight, color: Colors.green,),
                  Transport(name: "Train", icon: Icons.train, color: Colors.pink,),
                  Transport(name: "Bus", icon: Icons.directions_bus, color: Colors.blue,),
                ],
              ),
              SizedBox(height: 24,),
              Text("Best for you",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 16,),
              Container(
                height: 240,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Place(image: "assets/images/bien.jpg", name: "Alibag Beach", location: "India", numberOfStar: "4.7",),
                    Place(image: "assets/images/bien.jpg", name: "Alibag Beach", location: "India", numberOfStar: "4.7",),
                    Place(image: "assets/images/bien.jpg", name: "Alibag Beach", location: "India", numberOfStar: "4.7",),
                  ],
                ),
              ),
              SizedBox(height: 24,),
              Container(
                height: 60,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Coupon(title:"25% off on first booking", subtitle: "use coupon code 'PHIEN'",),
                    Coupon(title:"25% off on first booking", subtitle: "use coupon code 'PHIEN'",),

                  ],
                ),
              ),

            ],
          ),

        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.grey[200],
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.black,size: 30,), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.call, color: Colors.black,size: 30,), label: "Call"),
            BottomNavigationBarItem(icon: Icon(Icons.mail, color: Colors.black,size: 30,), label: "Mail"),
            BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.black,size: 30,), label: "Account"),

          ],
        ),
      ),
    );
  }
}




