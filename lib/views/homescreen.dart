import 'package:dbs_project/Constants/constantColors.dart';
import 'package:dbs_project/Utils/car.dart';
import 'package:dbs_project/Utils/car_grid.dart';
import 'package:dbs_project/Utils/lend.dart';
import 'package:dbs_project/Utils/profile.dart';
import 'package:dbs_project/Utils/rent.dart';
import 'package:dbs_project/views/addCar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

final List<Car> cars = [
  Car(
    name: 'Mercedes-Benz S-Class',
    imageUrl: 'https://images.unsplash.com/photo-1519681393784-d120267933ba',
    details: 'Luxury sedan',
  ),
  Car(
    name: 'Tesla Model S',
    imageUrl: 'https://images.unsplash.com/photo-1519681393784-d120267933ba',
    details: 'Electric car',
  ),
  Car(
    name: 'Ferrari 458 Italia',
    imageUrl: 'https://images.unsplash.com/photo-1519681393784-d120267933ba',
    details: 'Supercar',
  ),
  Car(
    name: 'Ford Mustang',
    imageUrl: 'https://images.unsplash.com/photo-1519681393784-d120267933ba',
    details: 'Muscle car',
  ),
  Car(
    name: 'Jeep Wrangler',
    imageUrl: 'https://images.unsplash.com/photo-1519681393784-d120267933ba',
    details: 'Off-road vehicle',
  ),
];

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  int current_page = 0;
  List<Widget> page = [rent(), lend(), profile()];

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff222831),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Color(0xff393E46),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              )),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            decoration: BoxDecoration(
                color: background, borderRadius: BorderRadius.circular(40)),
            child: GNav(
                onTabChange: (index) {
                  setState(() {
                    current_page = index;
                  });
                },
                color: Color(0xff00ADB5),
                activeColor: Color(0xffEEEEEE),
                tabBackgroundColor: Color(0xff3d4654),
                gap: 10,
                padding: EdgeInsets.all(10),
                tabs: [
                  GButton(
                    icon: Icons.car_rental_outlined,
                    text: 'Rent',
                  ),
                  GButton(
                    icon: Icons.money,
                    text: 'Lend',
                  ),
                  GButton(
                    icon: Icons.person,
                    text: 'Profile',
                  ),
                ]),
          ),
        ),
        body: page[current_page]);
  }
}





