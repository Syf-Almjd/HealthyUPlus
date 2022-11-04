import 'package:bmihealth_malaysia/MainPages/profile.dart';
import 'package:flutter/material.dart';
import '../Pages/detailsPage.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

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
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => profile()),
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
          // child: ButtonBar(
          //     padding: EdgeInsets.only(left: 25.0, right: 20.0),
          //     onPressed: () {
          //       showSearch(
          //         context: context,
          //         delegate: CustomSearch(),
          //       );
          //     },
          //
          //     icon: Icon(Icons.search)),
          //   decoration: BoxDecoration(
          //     color: Colors.red,
          //     borderRadius: BorderRadius.all(Radius.elliptical(50, 100))
          //     // borderRadius: BorderRadius.all(Radius.circular(50)),
          //     ),
          // ),
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
                          _buildFoodItem(
                              'assets/plate1.png', 'Salmon bowl', '\$24.00'),
                          _buildFoodItem(
                              'assets/plate2.png', 'Spring bowl', '\$22.00'),
                          _buildFoodItem(
                              'assets/plate6.png', 'Avocado bowl', '\$26.00'),
                          _buildFoodItem(
                              'assets/plate5.png', 'Berry bowl', '\$24.00')
                        ]))),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: <Widget>[
                //     Container(
                //       height: 65.0,
                //       width: 60.0,
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //             color: Colors.grey,
                //             style: BorderStyle.solid,
                //             width: 1.0),
                //         borderRadius: BorderRadius.circular(10.0),
                //       ),
                //       child: const Center(
                //         child: Icon(Icons.search, color: Colors.black),
                //       ),
                //     ),
                //     Container(
                //       height: 65.0,
                //       width: 60.0,
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //             color: Colors.grey,
                //             style: BorderStyle.solid,
                //             width: 1.0),
                //         borderRadius: BorderRadius.circular(10.0),
                //       ),
                //       child: const Center(
                //         child: Icon(Icons.shopping_basket, color: Colors.black),
                //       ),
                //     ),
                //     Container(
                //       height: 65.0,
                //       width: 120.0,
                //       decoration: BoxDecoration(
                //           border: Border.all(
                //               color: Colors.grey,
                //               style: BorderStyle.solid,
                //               width: 1.0),
                //           borderRadius: BorderRadius.circular(10.0),
                //           color: Color(0xFF1C1428)),
                //       child: const Center(
                //           child: Text('Checkout',
                //               style: TextStyle(
                //                   fontFamily: 'Montserrat',
                //                   color: Colors.white,
                //                   fontSize: 15.0))),
                //     )
                //   ],
                // )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFoodItem(String imgPath, String foodName, String price) {
    return Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(
                      heroTag: imgPath, foodName: foodName, foodPrice: price)));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(children: [
                  Hero(
                      tag: imgPath,
                      child: Image(
                          image: AssetImage(imgPath),
                          fit: BoxFit.cover,
                          height: 75.0,
                          width: 75.0)),
                  SizedBox(width: 10.0),
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

List<String> fruitlist = ['Apple', 'asd', 'asdasd'];

@override
class CustomSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> MatchQuery = [];
    for (var fruit in fruitlist) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        MatchQuery.add(query);
      }
    }
    return ListView.builder(
        itemCount: MatchQuery.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(MatchQuery[index]));
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> MatchQuery = [];

    for (var fruit in fruitlist) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        MatchQuery.add(query);
      }
    }
    return ListView.builder(
        itemCount: MatchQuery.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(MatchQuery[index]));
        });
  }
}
