import 'package:dbs_project/Constants/constantColors.dart';
import 'package:dbs_project/Utils/car.dart';
import 'package:dbs_project/views/homescreen.dart';
import 'package:flutter/material.dart';

class CarGridView extends StatelessWidget {
  CarGridView({Key? key, required this.n, required this.cars}) : super(key: key);
  final int n;
final List<Car> cars;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemCount: cars.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: n,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) {
        return Container(
          color: background2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 0,
              color: background2,
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      cars[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    cars[index].name,
                    style: TextStyle(
                      color: text,
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    cars[index].details,
                    style: TextStyle(
                      fontSize: height * 0.015,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
