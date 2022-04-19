import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sell/providerModil/providerModil.dart';
import '../SQFLite/DB.dart';
import '../SQFLite/ModelCategory.dart';
import '../providerModil/providerModil.dart';

class AddCategory extends StatefulWidget {
  final Category category;

  const AddCategory({Key? key, required this.category}) : super(key: key);

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  late DB helper;



  @override
  void initState() {
    super.initState();
    helper = DB();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
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
                            width: 125,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Center(
                                child: Text(widget.category.category,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ))))),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                            width: 79,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Center(
                                child: Text('${widget.category.price.toString()} LL',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ))))),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                            width: 165,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Consumer<MyModil>(builder: (context , model , child){
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () async{

                                      widget.category.number--;
                                      await helper.UpdateDataCategory(
                                          widget.category);

                                     model.total=widget.category.number * widget.category.price;
                                      model.counter();
                                    },
                                    child: const Icon(CupertinoIcons.back),
                                  ),
                                  Text(widget.category.number.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextButton(
                                    onPressed: () async {
                                      widget.category.number++;
                                      await helper.UpdateDataCategory(
                                          widget.category);
                                       model.counter();
                                    },
                                    child: const Icon(CupertinoIcons.chevron_right),
                                  ),
                                ],
                              );
                            } ,))),
                  ],
                )),
          ),
        ),
      ],
     );
  }
}