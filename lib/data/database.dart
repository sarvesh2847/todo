import 'package:hive_flutter/hive_flutter.dart';

class tododatabase {
  List Todolist = [];
  //referencing thr box

  final _mybox = Hive.box('mybox');

  //method is runned when it is first time opened.

  void createinitialdata() {
    Todolist = [
      ["Make app", false],
      ["Do exercise", false],
    ];
  }

//load the data drom database
  void loaddata() {
    Todolist = _mybox.get("TODOLIST");
  }
// update the data from database

  void updatedata() {
    _mybox.put("TODOLIST", Todolist);
  }
}
