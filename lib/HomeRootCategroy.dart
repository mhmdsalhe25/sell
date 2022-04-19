import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:sell/NewCategory.dart';
import 'package:sell/Widget/Category.dart';
import 'package:sell/SQFLite/DB.dart';
import 'package:sell/SQFLite/ModelCategory.dart';
import 'package:sell/providerModil/providerModil.dart';

class numberofpieces extends StatefulWidget {
  const numberofpieces({Key? key}) : super(key: key);

  @override
  State<numberofpieces> createState() => _numberofpiecesState();
}

class _numberofpiecesState extends State<numberofpieces> {
  late DB helper;


  @override
  void initState() {
    super.initState();
    helper = DB();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => NewCategory()));
              },
              icon: const Icon(CupertinoIcons.person_3_fill)),
        ],
        title: const Text('the number of pieces'),
      ),
      body: Stack(
        children: [

          FutureBuilder<List<Category>>(
              future: helper.RedAllDataCatgory(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  if (snapshot.data != null &&
                      snapshot.data is List &&
                      snapshot.data.length > 0) {
                    final List<Category> counterModels = snapshot.data;
                    Provider.of<MyModil>(context,listen: true).co= counterModels;
                    return ListView.builder(
                      itemCount: Provider.of<MyModil>(context).co.length,
                      itemBuilder: (BuildContext context, int index) {
                        Category category = counterModels[index];
                        return Slidable(
                            child: AddCategory(
                              category: category,
                            ));
                      },
                    );
                  }
                }
                return const Center(
                    child: Opacity(
                      opacity: 0.1,
                      child: Text(
                        'Press on (+) to add Category',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ));
              }),
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
                        Theme
                            .of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.1),
                        Theme
                            .of(context)
                            .scaffoldBackgroundColor,
                      ])),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 10,
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
                        padding: const EdgeInsets.all(13.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                )),
                            const SizedBox(),
                            Consumer<MyModil>(builder: (context, model, child) {
                              return
                                Text('${model.total}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ));
                            },
                                child: const SizedBox(),
                            ) ],
                        ),
                      ))),
            ),
          )
        ],
      ),
    );
  }
}


