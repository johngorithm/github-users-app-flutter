import 'package:flutter/material.dart';


class ImageCaption extends StatelessWidget {
  final String imageUrl;
  final String username;

  ImageCaption({this.username, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 3.0, color: Colors.white),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          username,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}