import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Salon extends StatefulWidget {
  const Salon({super.key});

  @override
  State<Salon> createState() => _Salon();
}

class _Salon extends State<Salon> {
  TextEditingController nameController = TextEditingController();
  String nameValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Salon"),
          backgroundColor: Colors.black,
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Center(
                      child: Text(
                        'One last step ..',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your Name',
                        hintText: "ex : Tito",
                      ),
                      onChanged: (text) {
                        setState(() {
                          nameValue = nameController.text;
                        });
                      },
                    ),
                  ),
                  Text(
                    nameValue,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(40),
                        backgroundColor: Colors.black, // Background color
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Guest',
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
