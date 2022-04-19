

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sell/SQFLite/DB.dart';
import 'package:sell/SQFLite/ModelCategory.dart';
import 'package:sell/providerModil/providerModil.dart';


class NewCategory extends StatefulWidget {
  const NewCategory({Key? key}) : super(key: key);

  @override
  State<NewCategory> createState() => _NewCategoryState();
}

class _NewCategoryState extends State<NewCategory> {
  late String categorye;
  late int price;
  int number = 0 ;
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
        title: const Text('New Category'),
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
                        hintText: 'Enter Category',
                        labelText: ' Category ',
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
                      categorye = (value);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    decoration: const InputDecoration(
                      hintText: 'Enter price',
                      labelText: ' price ',
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
                     price = int.parse(value);
                    },
                  ),

                ],
              ),
            ),
          ),
          ElevatedButton(onPressed: () async{
            print('oooooooooooooooooooooooooooooooooooooooooooooooooooo');
            Category category= Category(category: categorye, price:  price, number:  number);
            await helper.InsertDataCategory(category);
            Navigator.of(context).pop();
          }, child: const Text('Save User'),)
        ],
      ),

    );
  }
}
