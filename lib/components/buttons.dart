import 'package:flutter/material.dart';

// AP - AlignedPadded

fabExtendedAP(name, icon, color, location, padding, function){
  return Padding(
    padding: EdgeInsets.all(padding),
    child: Align(
      alignment: location,
      child: FloatingActionButton.extended(
        onPressed: function,
        label: Text(name),
        icon: Icon(icon),
        backgroundColor: color,
      ),
    ),
  );
}