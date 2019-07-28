import 'package:flutter/material.dart';
import 'package:github_users_flutter/constants/index.dart';

class ItemsCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;

  ItemsCard({@required this.child, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: primaryDark,
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: child,
    );
  }
}
