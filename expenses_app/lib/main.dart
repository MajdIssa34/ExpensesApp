

import 'package:expenses_app/expenses/expenses.dart';
import 'package:expenses_app/themes/theme_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),)
    );

  
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Expenses()
      ),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}