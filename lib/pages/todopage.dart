import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/data/database.dart';
import 'package:todo/utility/dialogue_box.dart';
import 'package:todo/utility/todo_tile.dart';

void main() {
  runApp(todopage());
}

class todopage extends StatefulWidget {
  const todopage({super.key});

//z

  @override
  State<todopage> createState() => _todopageState();
}

class _todopageState extends State<todopage> {
//refernce the box
  final _mybox = Hive.box('mybox');
  tododatabase db = tododatabase();

  @override
  void initState() {
    // if this time first time ever opening the app, then create the default data.
    if (_mybox.get("TODOLIST") == null) {
      db.createinitialdata();
    } else {
      //there exist the data
      db.loaddata();
    }

    super.initState();
  }

  // textcontroller
  final _controller = TextEditingController();
//list of tasks

  void checkboxchanged(bool? value, int index) {
    setState(() {
      db.Todolist[index][1] = !db.Todolist[index][1];
    });
  }

//save dialogue

  void savenewtask() {
    setState(() {
      db.Todolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updatedata();
  }

// create new task

  void createnewtask() {
    showDialog(
        context: context,
        builder: (context) {
          return dialogue_box(
            controller: _controller,
            onSave: savenewtask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  //delete task

  void deletetask(int index) {
    setState(() {
      db.Todolist.removeAt(index);
    });
    db.updatedata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("TO-do"),
        //elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createnewtask,
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
        itemCount: db.Todolist.length,
        itemBuilder: (context, index) {
          return todo_tile(
            taskname: db.Todolist[index][0],
            taskcompleted: db.Todolist[index][1],
            onChanged: (value) => checkboxchanged(value, index),
            deletefxn: (context) => deletetask(index),
          );
        },
      ),
    );
  }
}
