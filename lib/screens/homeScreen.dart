import 'package:CustomCounter/components/appBar.dart';
import 'package:CustomCounter/components/buttons.dart';
import 'package:CustomCounter/config/colors.dart';
import 'package:CustomCounter/config/defaultValues.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String counterName = "Sample Counter";

  String counter1 = " ";
  String counter2 = " ";

  int _counter1 = 0;
  int _counter2 = 0;

  bool canBeNegative = false;

  @override
  void initState(){
    super.initState();

    getCounterDataFromSP();
    checkData();
  }

  getCounterDataFromSP() async{
    SharedPreferences storage = await SharedPreferences.getInstance();

    setState(() {
      counterName = storage.getString('counterName');
      counter1 = storage.getString('counter1');
      counter2 = storage.getString('counter2');

      _counter1 = storage.getInt('_counter1');
      _counter2 = storage.getInt('_counter2');

      canBeNegative = storage.getBool('canBeNegative');
    });
  }

  checkData() async{
    SharedPreferences storage = await SharedPreferences.getInstance();

    if (storage.getBool('firstTime') == true) {
      defaultValues();
      storage.setBool('firstTime', false);
    } else return;
  }

  incrementCounter1() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    setState(() {
      _counter1++;
      storage.setInt('_counter1', _counter1);
    });
  }

  decrementCounter1() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    if (canBeNegative) {
      setState(() {
        _counter1--;
        storage.setInt('_counter1', _counter1);
      });
    } else {
      if (_counter1 <= 0) {
        return;
      } else {
        setState(() {
          _counter1--;
          storage.setInt('_counter1', _counter1);
        });
      }
    }
  }

  incrementCounter2() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    setState(() {
      _counter2++;
      storage.setInt('_counter2', _counter2);
    });
  }

  decrementCounter2() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    if (canBeNegative) {
      setState(() {
        _counter2--;
        storage.setInt('_counter2', _counter2);
      });
    } else {
      if (_counter2 <= 0) {
        return;
      } else {
        setState(() {
          _counter2--;
          storage.setInt('_counter2', _counter2);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(counterName, "Home"),
      body: Container(
        child: Stack(
          children: [
            fabExtendedAP(
              counter1,
              Icons.add,
              primary,
              Alignment.bottomLeft,
              15.0,
              incrementCounter1
            ),
            fabExtendedAP(
              counter1,
              Icons.remove,
              primary,
              Alignment.topLeft,
              15.0,
              decrementCounter1
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "$counter1\n$_counter1",
                  style: TextStyle(
                    fontSize: 22
                  ),
                )
              ),
            ),

            fabExtendedAP(
              counter2,
              Icons.add,
              primary,
              Alignment.bottomRight,
              15.0,
              incrementCounter2
            ),
            fabExtendedAP(
              counter2,
              Icons.remove,
              primary,
              Alignment.topRight,
              15.0,
              decrementCounter2
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "$counter2\n$_counter2",
                  style: TextStyle(
                    fontSize: 22
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}