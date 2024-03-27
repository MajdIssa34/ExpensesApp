import 'package:expenses_app/expenses/expense_item.dart';
import 'package:expenses_app/expesnes_models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.allExpenses, required this.onRemoveExpense});


  final List<Expense> allExpenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: allExpenses.length,
      itemBuilder: (listContext, index) => Dismissible(
        onDismissed: (direction) {
          onRemoveExpense(allExpenses[index],);
        },
        key: ValueKey(allExpenses[index]),
        child: ExpenseItem(allExpenses[index]),
      ) 
      
    );
  }
}