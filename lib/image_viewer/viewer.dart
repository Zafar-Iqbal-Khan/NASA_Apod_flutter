import 'package:flutter/material.dart';
import 'package:nasa_demo/model/apod.dart';

class Viewer extends StatefulWidget {
  final APOD apod;
  Viewer({this.apod});

  @override
  _ViewerState createState() => _ViewerState();
}

class _ViewerState extends State<Viewer> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.apod.imgUrl), fit: BoxFit.cover)),
      ),
    );
  }
}
