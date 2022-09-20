import 'package:flutter/material.dart';
import 'package:smartdepo/pages/widget/card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: h/5,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          height: h/10,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: h/10,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/depo.jpg",
                      ),
                      //fit: BoxFit.cover
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    "Smart Depo",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),

      body: ListView(
          padding: EdgeInsets.symmetric(vertical: 5),
          children: [
            CardWidget("assets/icons/icon_lab.png", "Labaratoriya")
          ],
        ),
    );
  }
}
