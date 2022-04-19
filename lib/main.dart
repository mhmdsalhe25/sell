import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sell/providerModil/providerModil.dart';
import 'HomeRootUser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => MyModil(),
    child: MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black38),
        scaffoldBackgroundColor: Colors.grey[800],
        primaryColor: Colors.grey,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 80,
            color: Colors.white,
          ),
        ),
      ),
      home: HomeRoot(),
    ) ,);
  }
}


