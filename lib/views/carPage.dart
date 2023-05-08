import 'package:dbs_project/Constants/constantColors.dart';
import 'package:dbs_project/Utils/car.dart';
import 'package:flutter/material.dart';

import 'homescreen.dart';



class carPage extends StatefulWidget {
  const carPage(
      {
        required this.car,
        required this.page_no,
        Key? key
      }) : super(key: key);

  final Car car;
  final int page_no;

  @override
  State<carPage> createState() => _carPageState();
}

class _carPageState extends State<carPage> {
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    Car car= widget.car;
    return Scaffold(
      appBar: AppBar(
        title: Text(car.name),
        backgroundColor: background2,
      ),
      backgroundColor: background,
      body: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SizedBox(
              height: height*0.03,
            ),
            Center(
              child: Container(
                color: background2,
                width: width*0.9,
                child: Image.network(
                  car.imageUrl,
                  fit: BoxFit.cover,
                ),

              ),
            ),
            SizedBox(
              height: height*0.04,
            ),
            Text(car.name, style: TextStyle(color: text, fontSize: height*0.0338, fontWeight: FontWeight.bold),),
            SizedBox(
              height: height*0.01,
            ),
            Text(car.car_number, style: TextStyle(color: highlight, fontSize: height*0.024),),
            SizedBox(
              height: height*0.03,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width*0.0),
              margin: EdgeInsets.symmetric(horizontal: width*0.1),
              height: height*0.13,
              decoration: BoxDecoration(
                  color: background2,

                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Price:", style: TextStyle(color: highlight, fontSize: height*0.03),),

                      Text(car.cost.toString(), style: TextStyle(color: text, fontSize: height*0.028),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Late Fee:", style: TextStyle(color: highlight, fontSize: height*0.03),),

                      Text(car.late_fee.toString(), style: TextStyle(color: text, fontSize: height*0.028),)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height*0.02,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width*0.0),
              margin: EdgeInsets.symmetric(horizontal: width*0.1),
              height: height*0.13,
              decoration: BoxDecoration(
                  color: background2,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("No. of Passengers:", style: TextStyle(color: highlight, fontSize: height*0.03),),

                      Text(car.cost.toString(), style: TextStyle(color: text, fontSize: height*0.028),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("No. of luggages:", style: TextStyle(color: highlight, fontSize: height*0.03, ),),

                      Text(car.late_fee.toString(), style: TextStyle(color: text, fontSize: height*0.028),)
                    ],
                  ),


                ],
              ),
            ),
              SizedBox(
                height: height*0.03,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: width*0.07),
                child: SizedBox(
                  width: width,
                  child: ElevatedButton(
                    onPressed: (widget.page_no == 0)?
                        (){
                        }:
                        (){},
                    child: Text((widget.page_no == 0)? "BOOK": "DELETE VEHICLE", style: TextStyle(color: Colors.black, fontSize: height*0.0278, fontWeight: FontWeight.bold),),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(highlight),
                      padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: height*0.013))
                    ),
                  ),
                ),
              ),
          ],
        ),

    );
  }
}
