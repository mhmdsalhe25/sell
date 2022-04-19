import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:sell/NewUser.dart';
import 'package:sell/SQFLite/DB.dart';
import 'package:sell/SQFLite/ModelUser.dart';
import 'package:sell/Widget/RootaddUser.dart';
import 'package:sell/HomeRootCategroy.dart';

class HomeRoot extends StatefulWidget {
  const HomeRoot({Key? key}) : super(key: key);

  @override
  State<HomeRoot> createState() => _HomeRootState();
}

class _HomeRootState extends State<HomeRoot> {
  late DB helper;
 int price =0;
  @override
  void initState() {
    super.initState();
    helper = DB();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Customer account'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const numberofpieces()));
              },
              icon: const Icon(CupertinoIcons.person_3_fill)),
          IconButton(
              onPressed: () {}, icon: const Icon(CupertinoIcons.calendar)),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const NewUser()));
              },
              icon: const Icon(CupertinoIcons.add_circled)),
        ],
      ),
      body: Stack(
        children: [
          FutureBuilder<List<User>>(
            future: helper.RedAllData(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                if (snapshot.data != null &&
                    snapshot.data is List &&
                    snapshot.data.length > 0) {
                  final List<User> counterModels = snapshot.data;
                  return ListView.builder(
                    itemCount: counterModels.length,
                    itemBuilder: (BuildContext context, int index) {
                      User user = counterModels[index];
                      return Slidable(
                        child: Customser(
                          user: user,
                        ),
                      );
                    },
                  );
                }
              }
              return const Center(
                child: Opacity(
                  opacity: 0.1,
                  child: Text(
                    'Press on (+) to add Counters',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.1),
                      Theme.of(context).scaffoldBackgroundColor,
                    ]),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width - 10,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 60,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                  width: 84,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text('Total',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            )),SizedBox(),
                        Text('${price}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            )),

                        Text('${price}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


