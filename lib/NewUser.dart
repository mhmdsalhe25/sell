import 'package:flutter/material.dart';
import 'package:sell/SQFLite/DB.dart';
import 'package:sell/SQFLite/ModelUser.dart';


class NewUser extends StatefulWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {


  late String name;
  late int pieces;
  late DB helper;
  @override
  void initState() {
    super.initState();
    helper= DB();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New User'),
      ),
      body: Column(
        children: [
          Form(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                        hintText: 'Enter Name',
                        labelText: ' Name ',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          backgroundColor: Colors.white,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.black26,
                        ),
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true),
                    onChanged: (value) {
                      name = (value);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    decoration: const InputDecoration(
                      hintText: 'Enter pieces',
                      labelText: ' pieces ',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        backgroundColor: Colors.white,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      ),
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onChanged: (value) {
                      pieces = int.parse(value);
                    },
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(onPressed: () async{
            User user=User(name: name, pieces: pieces ,);
            await helper.InsertData(user);

            Navigator.of(context).pop();
          }, child: const Text('Save User'),)
        ],
      ),

    );
  }
}
