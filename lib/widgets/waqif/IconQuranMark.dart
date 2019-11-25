import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconQuranMark extends StatelessWidget {
  IconQuranMark({this.icon, this.colorBox, this.iconColor, this.onTap});
  final IconData icon;
  final Color colorBox,iconColor;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:
          Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
                color: colorBox,
                shape: BoxShape.circle
            ),
            child: RawMaterialButton(
              shape: CircleBorder(),
              child: Icon(icon, color: iconColor,),
            ),
          ),
    );
  }
}