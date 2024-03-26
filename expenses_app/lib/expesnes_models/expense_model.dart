import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category {food, experience, shopping, accomodation}

const categoryIcons = {
  Category.food: Icons.fastfood_rounded,
  Category.experience: Icons.skateboarding_sharp,
  Category.shopping: Icons.shopping_cart,
  Category.accomodation: Icons.home,
};

class Expense {

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }

}