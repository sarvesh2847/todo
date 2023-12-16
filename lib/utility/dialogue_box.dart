import 'package:flutter/material.dart';
import 'package:todo/utility/mybutton.dart';

class dialogue_box extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  dialogue_box(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Add a new task"),
          ),
          //button
          Padding(padding: EdgeInsets.only(top: 8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //save
              mybutton(text: "Save", onpressed: onSave),
              const SizedBox(
                width: 10,
              ),
              //cancel
              mybutton(text: "Cancel", onpressed: onCancel),
            ],
          )
        ]),
      ),
    );
  }
}
