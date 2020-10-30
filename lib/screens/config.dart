import 'package:CustomCounter/components/appBar.dart';
import 'package:CustomCounter/components/buttons.dart';
import 'package:CustomCounter/config/colors.dart';
import 'package:CustomCounter/config/defaultValues.dart';
import 'package:CustomCounter/widgets/configWidgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final counterNameController = TextEditingController();
final counter1Controller = TextEditingController();
final counter2Controller = TextEditingController();

final kHintTextStyle = TextStyle(
  color: Colors.grey[600],
);

final kLabelStyle = TextStyle(
  color: Colors.grey[600],
  fontWeight: FontWeight.bold,
);

final kBoxDecorationStyle = BoxDecoration(
  color: secondary,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

class Config extends StatefulWidget {
  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State < Config > {
  String counterName;

  String counter1;
  String counter2;

  int _counter1 = 0;
  int _counter2 = 0;


  bool canBeNegative = false;

  @override
  void initState() {
    super.initState();
  }

  getCounterDataFromSP() async {
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

  saveScreenName() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    setState(() {
      counterName = counterNameController.text;
      storage.setString('counterName', counterName);
    });
  }

  saveCounter1() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    setState(() {
      counter1 = counter1Controller.text;
      storage.setString('counter1', counter1);
    });
  }

  saveCounter2() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    setState(() {
      counter2 = counter2Controller.text;
      storage.setString('counter2', counter2);
    });
  }

  @override
  Widget build(BuildContext context) {
    getCounterDataFromSP();
    return Scaffold(
      appBar: renderAppBar(counterName, "Config"),
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: < Widget > [
                Text(
                  'Can a ctr be negative?',
                  style: kLabelStyle,
                ),
                SizedBox(height: 5.0),
                Switch(
                  value: canBeNegative,
                  onChanged: (value) {
                    setState(() async{
                      SharedPreferences storage = await SharedPreferences.getInstance();
                      canBeNegative = value;
                      storage.setBool('canBeNegative', canBeNegative);
                      print(canBeNegative);
                      if(canBeNegative == false){
                        if (_counter1 < 0) {
                          _counter1 = 0;
                          storage.setInt('_counter1', _counter1);
                        }
                        if(_counter2 < 0) {
                          _counter2 = 0;
                          storage.setInt('_counter2', _counter2);
                        }
                      }
                    });
                  },
                  activeColor: primary,
                  activeTrackColor: secondary,
                )
              ],
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: buildCounterName(),
            ),
            fabExtendedAP(
              "Save",
              Icons.save,
              primary,
              Alignment.center,
              15.0,
              saveScreenName
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: buildCounter1(),
            ),
            fabExtendedAP(
              "Save",
              Icons.save,
              primary,
              Alignment.center,
              15.0,
              saveCounter1
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: buildCounter2(),
            ),
            fabExtendedAP(
              "Save",
              Icons.save,
              primary,
              Alignment.center,
              15.0,
              saveCounter2
            ),
            
            SizedBox(height: 10.0),
            fabExtendedAP(
              "RESET",
              Icons.undo,
              Colors.red,
              Alignment.center,
              15.0,
              defaultValues
            ),
          ],
        ),
      ),
    );
  }
}