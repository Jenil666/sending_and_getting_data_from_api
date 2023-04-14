import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sending_and_getting_data_from_api/screens/add_data/provider/add_data_poovider.dart';
import 'package:sending_and_getting_data_from_api/screens/add_data/view/add_screen.dart';
import 'package:sending_and_getting_data_from_api/screens/watch_data/provider/add_provider.dart';
import 'package:sending_and_getting_data_from_api/screens/watch_data/view/view_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AddScreenProvider(),),
        ChangeNotifierProvider(create: (context) => AddProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //initialRoute: 'add',
        routes: {
          '/':(context) => ViewScreen(),
          'add':(context) => AddScreen(),
        },
      ),
    ),
  );
}
