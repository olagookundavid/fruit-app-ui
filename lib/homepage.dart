import 'package:flutter/material.dart';
import 'recipedetails.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
              height: screenHeight,
              width: screenWidth,
              color: Colors.transparent),
          Container(
            height: 200.0,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/greenapple.jpg'),
                    fit: BoxFit.cover)),
          ),
          Positioned(
              left: 25.0,
              top: 75.0,
              child: Container(
                height: 400.0,
                width: 335.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(15.0)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4.0,
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 4.0,
                          offset: const Offset(0.0, -6.0))
                    ]),
                child: ListView(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
                      child: Text(
                        'Fruit Recipes',
                        style: TextStyle(
                            // fontFamily: 'Montserrat',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, bottom: 20.0, right: 25.0),
                      child: Text(
                        'Enjoy one of our delicious fruit recipes',
                        style: TextStyle(
                            // fontFamily: 'Montserrat',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF9E9E9E)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, bottom: 10.0),
                      child: SizedBox(
                          height: 275.0,
                          width: 310.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              _buildFoodCard(
                                  'Fruit Salad', '248kcal', 'assets/salad.png'),
                              _buildFoodCard('Apple Pie', '124kcal',
                                  'assets/applepie.png'),
                              _buildFoodCard('Green Salad', '241kcal',
                                  'assets/greensalad.png')
                            ],
                          )),
                    )
                  ],
                ),
              )),
          Positioned(
              bottom: 15.0,
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text(
                      'Your Favorites',
                      style: TextStyle(
                          // fontFamily: 'Montserrat',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 15.0),
                      child: SizedBox(
                          width: screenWidth - 45.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Stack(children: <Widget>[
                                    Container(
                                      height: 100.0,
                                      width: 150.0,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          color: const Color(0xFF77E8CB)),
                                    ),
                                    Positioned(
                                      top: 25.0,
                                      left: 60.0,
                                      child: Container(
                                        height: 100.0,
                                        width: 100.0,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/applepie.png'),
                                                fit: BoxFit.cover)),
                                      ),
                                    )
                                  ]),
                                  const SizedBox(height: 15.0),
                                  const Text(
                                    'Apple Pie',
                                    style: TextStyle(
                                        // fontFamily: 'Montserrat',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Stack(children: <Widget>[
                                    Container(
                                      height: 100.0,
                                      width: 150.0,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          color: const Color(0xFF77E8CB)),
                                    ),
                                    Positioned(
                                      top: 25.0,
                                      left: 60.0,
                                      child: Container(
                                        height: 100.0,
                                        width: 100.0,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/greensalad.png'),
                                                fit: BoxFit.cover)),
                                      ),
                                    )
                                  ]),
                                  const SizedBox(height: 15.0),
                                  const Text(
                                    'Green Salad',
                                    style: TextStyle(
                                        // fontFamily: 'Montserrat',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              )
                            ],
                          )))
                ],
              ))
        ],
      ),
    );
  }

  Widget _buildFoodCard(String title, String calCount, String imgPath) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => RecipeDetails(
                  heroTag: imgPath, calCount: calCount, dishName: title)));
        },
        child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
            child: Stack(children: [
              const SizedBox(
                height: 275.0,
                width: 200.0,
              ),
              Positioned(
                  top: 7.0,
                  child: Container(
                    height: 250.0,
                    width: 175.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color(0xFF20D3D2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(title,
                              style: const TextStyle(
                                  // fontFamily: 'Montserrat',
                                  fontSize: 15.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 7.0),
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text(
                              'A refreshing and incredible testing fruit salad',
                              style: TextStyle(
                                  // fontFamily: 'Montserrat',
                                  fontSize: 12.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400)),
                        ),
                        const SizedBox(height: 25.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(calCount,
                              style: const TextStyle(
                                  // fontFamily: 'Montserrat',
                                  fontSize: 15.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 25.0),
                      ],
                    ),
                  )),
              Positioned(
                  left: 90.0,
                  child: Hero(
                      tag: imgPath,
                      child: Container(
                        height: 110.0,
                        width: 110.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imgPath), fit: BoxFit.cover)),
                      )))
            ])));
  }
}
