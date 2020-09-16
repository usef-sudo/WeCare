import 'package:amazone_teckathon/Models/Charity.dart';
import 'package:amazone_teckathon/Models/Requist.dart';
import 'package:amazone_teckathon/pages/details.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../shared.dart';

class CategoryListPage extends StatefulWidget {
  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  List<Charity> searchResults;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    charities = [
      Charity(
          discription: "yayayayayyayayayayayayay",
          email: "ana@jdmplp.coid",
          name: "the hashmia found organization charity ",
          password: "*********",
          charitydonations: [
            Request(
              discription: "asdfghjklktrewsdfghjkjhgfddcvbnm,mnbv",
              location: "Amman",
            ),
          ])
    ];
    searchResults = charities;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xffF9F9F9),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.info,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () => {
                    AwesomeDialog(
                      dialogType: DialogType.INFO,
                      context: context,
                      width: MediaQuery.of(context).size.width / 1.2,
                      headerAnimationLoop: false,
                      animType: AnimType.BOTTOMSLIDE,
                      title: 'About Events',
                      desc:
                          'here you can find all the charities,big clap for those awesome charities for their awesome work so far.',
                    )..show()
                  },
                ),
              )
            ],
            backgroundColor: Colors.blue[100],
            title: Center(
                child: Text(
              "Charities  ",
              style: TextStyle(color: Colors.black),
            )),
          ),
          body: Container(
            margin: const EdgeInsets.only(top: 5),
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 0.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                    ),
                    child: Card(
                      elevation: 10,
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                            prefixIcon: Icon(Icons.search)),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            List<Charity> tempList = List<Charity>();
                            charities.forEach((charity) {
                              if (charity.name.toLowerCase().contains(value)) {
                                tempList.add(charity);
                              }
                            });
                            setState(() {
                              searchResults.clear();
                              searchResults.addAll(tempList);
                            });
                            return;
                          } else {
                            setState(() {
                              searchResults.clear();
                              searchResults.addAll(charities);
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (_, index) => Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 16.0,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 150,
                            color: Colors.blue[50],
                            child: Card(
                                color: Colors.blue[50],
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 200,
                                      child: Text(
                                        searchResults[index].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                    RaisedButton(
                                      disabledColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side:
                                              BorderSide(color: Colors.black)),
                                      color: Colors.white,
                                      child: Text(
                                        "View page",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      onPressed: () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Details(
                                                  searchResults[index])),
                                        )
                                      },
                                    )
                                  ],
                                )),
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
