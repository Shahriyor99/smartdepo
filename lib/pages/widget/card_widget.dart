import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {

  String _image;
  String _page_name;

  CardWidget(this._image, this._page_name);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {

    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: h/5,
      decoration: BoxDecoration(
        //shadow
        boxShadow: [BoxShadow(
          color: Colors.black.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),],
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget._image),
                  )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
