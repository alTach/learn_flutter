import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  static  String getFormatedDate(DateTime dateTime) {
    return DateFormat('EEE, MM d, y').format(dateTime); // Tue, May 5, 2020
  }
  static getItem(IconData iconData, int value, String units) {
    return Column(
      children: [
        Icon(iconData, color: Colors.black87, size: 28,),
        SizedBox(height: 20, width: 200,),
        Text('$value', style: TextStyle(fontSize: 20, color: Colors.black87)),
        SizedBox(height: 20, width: 200,),
        Text('$units', style: TextStyle(fontSize: 15, color: Colors.black87)),
      ],
    );
  }
}