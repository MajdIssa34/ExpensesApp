//import 'package:expenses_app/expenses/expenses.dart';
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

  class ExpensesContainer{
    const ExpensesContainer({required this.expenses, required this.category});

    ExpensesContainer.forCategory(List<Expense> allExpenses, this.category):
      expenses = allExpenses.where((expense) => expense.category == category).toList();

    final Category category;
    final List<Expense> expenses;

    double get sumOfExpenses{
      double sum = 0;
      for(int i = 0 ; i < expenses.length ; i++){
        sum+=expenses[i].amount;
      }
      return sum;
    }
  }