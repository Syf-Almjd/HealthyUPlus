import 'package:bmihealth_malaysia/MainPages/profile.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import '../Pages/detailsPage.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF39BF21),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                const Text('Food',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                const SizedBox(width: 10.0),
                const Text('Calories',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0)),
                const Expanded(child: SizedBox()),
                const SizedBox(
                  height: 25.0,
                  width: 25.0,
                ),
                IconButton(
                  padding: const EdgeInsets.all(0.0),
                  icon: const IconTheme(
                    data: IconThemeData(color: Colors.white),
                    child: Icon(FontAwesome5.heartbeat, size: 25.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => profile()),
                    );
                  },
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.only(left: 25.0, right: 25.0),
            width: double.infinity,
            height: 60.0,
            child: TextField(
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search...",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height - 300.0,
                        child: ListView(children: [
                          _WebbuildFoodItem(
                              'https://pbs.twimg.com/profile_images/1334124254896406529/-P_-ZOyL_400x400.jpg',
                              'Name',
                              '\$ ',
                              'Asd1',
                              'Asd2',
                              'Asd3',
                              'Asd4',
                              'Asd5'
                          ),
                          _WebbuildFoodItem(
                              'https://pbs.twimg.com/profile_images/1334124254896406529/-P_-ZOyL_400x400.jpg',
                              'Name',
                              '\$price',
                              '',
                              '',
                              '',
                              '',
                              ''
                          ),
                          _WebbuildFoodItem(
                              'https://pbs.twimg.com/profile_images/1334124254896406529/-P_-ZOyL_400x400.jpg',
                              'Name',
                              '\$price',
                              '',
                              '',
                              '',
                              '',
                              ''
                          ),
                          _WebbuildFoodItem(
                              'https://pbs.twimg.com/profile_images/1334124254896406529/-P_-ZOyL_400x400.jpg',
                              'Name',
                              '\$price',
                              '',
                              '',
                              '',
                              '',
                              ''
                          ),
                        ]))),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _WebbuildFoodItem(String imgPath, String foodName, String price, String foodtype, String ricedata, String datacal, String dataamnt, String dataamnttype) {
    return Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(
                      heroTag: imgPath, foodName: foodName, foodPrice: price, foodType: foodtype, dataRice: ricedata, dataCal: datacal, dataAmnt: dataamnt, dataAmntType: dataamnttype)));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(children: [
                      Hero(
                        tag: imgPath,
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                  image: NetworkImage(imgPath), fit: BoxFit.fill),
                            ),
                            height: 75.0,
                            width: 75.0),
                            ),
                      const SizedBox(width: 10.0),
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(foodName,
                            style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold)),
                        Text(price,
                            style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15.0,
                                color: Colors.grey))
                      ])
                ])),
                IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.black,
                    onPressed: () {})
              ],
            )));
  }
}
