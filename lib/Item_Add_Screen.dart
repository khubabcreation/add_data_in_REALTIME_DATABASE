import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class addItemScreen extends StatefulWidget {
  const addItemScreen({Key? key}) : super(key: key);

  @override
  State<addItemScreen> createState() => _addItemScreenState();
}

class _addItemScreenState extends State<addItemScreen> {
  final ref = FirebaseDatabase.instance.ref('Class');
  final itemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: itemController,
            decoration: InputDecoration(labelText: 'Enter data here'),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              String id = DateTime.now().millisecond.toString();
              ref.child(id).set({
                'Name': itemController.text.toString(),
                'id': id.toString()
              });
            },
            child: Icon(Icons.add))
      ],
    );
  }
}
