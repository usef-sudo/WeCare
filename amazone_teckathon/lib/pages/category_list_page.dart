
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';


class CategoryListPage extends StatefulWidget {
  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {


  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                          'clp for those awesome charities for their awesome work so far.',
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
          body:Text("hiuggdtgfhjk")
        ),
      ),
    );
  }
}
