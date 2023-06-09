import 'package:dbs_project/Constants/constantColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override

  int current_page=0;
  List<Widget> page= [rent(), lend(), profile()];

  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xff222831),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color:Color(0xff393E46),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40), )
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(40)
          ),
          child: GNav(
              onTabChange: (index){
                setState(() {
                  current_page=index;
                });
              },
              color: Color(0xff00ADB5),
            activeColor: Color(0xffEEEEEE),
            tabBackgroundColor: Color(0xff3d4654),
            gap: 10,
              padding: EdgeInsets.all(10),
              tabs: [
                GButton(icon: Icons.car_rental_outlined,
                  text: 'Rent',
                ),
                GButton(icon: Icons.money,
                text: 'Lend',
                ),
                GButton(icon: Icons.person,
                  text: 'Profile',
                ),

              ]
          ),
        ),
      ),
      body: page[current_page]
    );
  }

  }


class Car {
  final String name;
  final String imageUrl;
  final String details;

  Car({required this.name, required this.imageUrl, required this.details});
}

class rent extends StatefulWidget {
   rent({Key? key}) : super(key: key);

  @override
  State<rent> createState() => _rentState();
}

class _rentState extends State<rent> {
  @override
  DateTime? _pickupDate;

  DateTime? _dropDate;
  int n=2;


  TextEditingController city=TextEditingController();

  Widget build(BuildContext context) {


    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;

    void _pickupDatePicker() {
      showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(DateTime
              .now()
              .year + 2))
          .then((value) {
        setState(() {
          _pickupDate = value;
          print(_pickupDate);
        });
      });
    }

    void _dropDatePicker() {
      showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(DateTime
              .now()
              .year + 2))
          .then((value) {
        setState(() {
          _dropDate = value;
        });
      });
    }


    return SingleChildScrollView(
      child: Container(
        color: background2,
        child: SafeArea(
          child: Container(
            width: width,
            //height: height,
            color: background,
            child: Column(
              children: [

                Container(

                  child: Column(
                    children: [
                      Container(
                        height: height*0.09,
                        width: width,
                        color: background2,
                        child: Padding(

                          padding:  EdgeInsets.symmetric(vertical: height*0.01, horizontal: width*0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              GestureDetector(
                                onTap: _pickupDatePicker,
                                child: Container(
                                    height: height*0.2,
                                    width: width*0.45,
                                    decoration: BoxDecoration(
                                        color: background,
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Center(
                                        child: (_pickupDate.toString() != "null")?
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("From: ", style: TextStyle(color: text, fontSize:height*0.0178, fontWeight: FontWeight.w600),),
                                            Text(
                                              _pickupDate!.day.toString() +
                                                  "/" +
                                                  _pickupDate!.month.toString() +
                                                  "/" +
                                                  _pickupDate!.year.toString(),
                                              style: TextStyle(color: text, fontSize:height*0.0178, fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ):
                                        Text("Pickup Date", style: TextStyle(color: text, fontSize:height*0.0178, fontWeight: FontWeight.w600))

                                    )
                                ),
                              ),
                              SizedBox(
                                width: width*0.03,
                              ),
                              GestureDetector(
                                onTap: _dropDatePicker,
                                child: Container(
                                    height: height*0.2,
                                    width: width*0.45,
                                    decoration: BoxDecoration(
                                        color: background,
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Center(
                                        child: (_dropDate.toString() != "null")?
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("To: ", style: TextStyle(color: text, fontSize:height*0.0178, fontWeight: FontWeight.w600),),
                                            Text(
                                              _dropDate!.day.toString() +
                                                  "/" +
                                                  _dropDate!.month.toString() +
                                                  "/" +
                                                  _dropDate!.year.toString(),
                                              style: TextStyle(color: text, fontSize:height*0.0178, fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ):
                                        Text("Drop Date", style: TextStyle(color: text, fontSize:height*0.0178, fontWeight: FontWeight.w600))

                                    )
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: height*0.08,
                        width: width,
                        color: background2,
                        child: Padding(

                          padding:  EdgeInsets.symmetric(vertical: height*0.01, horizontal: width*0.03),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: width*0.05, vertical: height*0.015),
                            width: width,
                            decoration: BoxDecoration(
                                color: background,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: TextField(

                              style: TextStyle(color: text, fontSize: height*0.0178, fontWeight: FontWeight.w600,),
                              controller: city,
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: Icon(Icons.pin_drop, color: Colors.white,),
                                hintText: "City",
                                hintStyle: TextStyle(color: text, fontSize: height*0.0178, fontWeight: FontWeight.w600, ),


                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: height*0.08,
                        width: width,
                        color: background2,
                        child: Padding(

                          padding:  EdgeInsets.symmetric(vertical: height*0.01, horizontal: width*0.03),
                          child: ElevatedButton(
                            onPressed: (){
                            },
                            child: Text("SEARCH", style: TextStyle(color: text, fontSize: height*0.024, fontWeight: FontWeight.w600),),
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height*0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Available Cars!!", style: GoogleFonts.ubuntu( textStyle:  TextStyle(color: text, fontSize: height*0.0177, fontWeight: FontWeight.w500)),),
                      Row(
                        children: [
                          IconButton(
                              onPressed: (){
                                setState(() {
                                  n=2;
                                });
                              },
                              icon:Icon(Icons.grid_view, color: text,),
                          ),
                          IconButton(onPressed: (){
                            setState(() {
                              n=3;
                            });
                          },
                              icon: Icon(Icons.grid_on_outlined, color: text,)
                          ),


                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(child: CarGridView(n: n))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CarGridView extends StatelessWidget {
  CarGridView({Key? key, required this.n}) : super(key: key);
  final int n;

  @override
  Widget build(BuildContext context) {

    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;

    final List<Car> cars = [Car(
      name: 'Mercedes-Benz S-Class',
      imageUrl: 'https://images.unsplash.com/photo-1519681393784-d120267933ba',
      details: 'Luxury sedan',
    ), Car(
      name: 'Tesla Model S',
      imageUrl: 'https://images.unsplash.com/photo-1519681393784-d120267933ba',
      details: 'Electric car',
    ), Car(
      name: 'Ferrari 458 Italia',
      imageUrl: 'https://images.unsplash.com/photo-1519681393784-d120267933ba',
      details: 'Supercar',
    ), Car(
      name: 'Ford Mustang',
      imageUrl: 'https://images.unsplash.com/photo-1519681393784-d120267933ba',
      details: 'Muscle car',
    ), Car(
      name: 'Jeep Wrangler',
      imageUrl: 'https://images.unsplash.com/photo-1519681393784-d120267933ba',
      details: 'Off-road vehicle',
    ),];

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
                      fontSize: height*0.02,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    cars[index].details,
                    style: TextStyle(
                      fontSize: height*0.015,
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

class lend extends StatefulWidget {
  const lend({Key? key}) : super(key: key);

  @override
  State<lend> createState() => _lendState();
}

class _lendState extends State<lend> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

      ],
    )
  }
}


class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,

    );
  }
}
