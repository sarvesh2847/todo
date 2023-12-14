import 'package:flutter/material.dart';

void main() {
  runApp(todopage());
}

class todopage extends StatefulWidget {
  const todopage({super.key});

  @override
  State<todopage> createState() => _todopageState();
}

class _todopageState extends State<todopage> {
  TextEditingController mycontroller = TextEditingController();
// greeting message
  String greetingmessage = "";

// greet user
  void greetUser() {
    setState(() {
      greetingmessage = "hello" + mycontroller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //greeting message
            Text(greetingmessage),
            TextField(
              controller: mycontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Type",
              ),
            ),
            //button
            ElevatedButton(onPressed: greetUser, child: Text("Tap"))
          ],
        ),
      )),
    );
  }
}
