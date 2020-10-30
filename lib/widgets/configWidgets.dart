import 'package:CustomCounter/screens/config.dart';
import 'package:flutter/material.dart';

Widget buildCounterName() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: < Widget > [
      Text(
        'Counter Name',
        style: kLabelStyle,
      ),
      SizedBox(height: 5.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60,
        child: TextField(
          cursorWidth: 2.5,
          cursorColor: Colors.grey[600],
          controller: counterNameController,
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.grey[600]),
          decoration: InputDecoration(

            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.text_fields,
              color: Colors.grey[600],
            ),
            hintText: "Enter the name of the counter",
            hintStyle: kHintTextStyle,
          ),
        ),
      )
    ],
  );
}

Widget buildCounter1() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: < Widget > [
      Text(
        'Thing 1',
        style: kLabelStyle,
      ),
      SizedBox(height: 5.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60,
        child: TextField(
          cursorWidth: 2.5,
          cursorColor: Colors.grey[600],
          controller: counter1Controller,
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.grey[600]),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.text_fields,
              color: Colors.grey[600],
            ),
            hintText: "Enter the name of the first thing to count",
            hintStyle: kHintTextStyle,
          ),
        ),
      )
    ],
  );
}

Widget buildCounter2() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: < Widget > [
      Text(
        'Thing 2',
        style: kLabelStyle,
      ),
      SizedBox(height: 5.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60,
        child: TextField(
          cursorWidth: 2.5,
          cursorColor: Colors.grey[600],
          controller: counter2Controller,
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.grey[600]),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.text_fields,
              color: Colors.grey[600],
            ),
            hintText: "Enter the name of the second thing to count",
            hintStyle: kHintTextStyle,
          ),
        ),
      )
    ],
  );
}