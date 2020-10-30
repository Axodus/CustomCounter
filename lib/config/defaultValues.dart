import 'package:shared_preferences/shared_preferences.dart';

void defaultValues() async{
  SharedPreferences storage = await SharedPreferences.getInstance();

  storage.setString('counterName', "Sample Counter");
  
  // Defining counter names
  storage.setString("counter1", "counter1");
  storage.setString("counter2", "counter2");

  // Defining counter values
  storage.setInt('_counter1', 0);
  storage.setInt('_counter2', 0);

  // Defining other data
  storage.setBool('canBeNegative', false);
}