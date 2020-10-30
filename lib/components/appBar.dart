import 'package:CustomCounter/config/colors.dart';
import 'package:flutter/material.dart';

renderAppBar(counterName, screenName) {
  return AppBar(
    title: Text("$counterName - $screenName"),
    centerTitle: true,
    backgroundColor: primary,
  );
}