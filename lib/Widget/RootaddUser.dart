import 'package:flutter/material.dart';
import 'package:sell/SQFLite/DB.dart';

import '../SQFLite/ModelUser.dart';


class Customser extends StatefulWidget {
  final User user;
  const Customser({Key? key, required this.user})
      :super(key: key);

  @override
  State<Customser> createState() => _CustomserState();
}

class _CustomserState extends State<Customser> {
  late DB helper;
  @override
  void initState() {
    super.initState();
    helper = DB();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 10,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 60,
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Center(
                              child: Text(widget.user.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ))))),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                          width: 85,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: const Center(
                              child: Text('',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ))))),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                          width: 84,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Center(
                              child: Text(widget.user.pieces.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ))))),
                ],
              )
            ),
          ),
        ),
      ],
    );
  }
}
