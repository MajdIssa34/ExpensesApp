import 'package:expenses_app/expenses/expenses.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Expenses()
        ),
      ),
    );
}