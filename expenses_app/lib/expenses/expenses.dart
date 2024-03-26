import 'package:expenses_app/expenses/expense_list.dart';
import 'package:expenses_app/expenses/new_expense.dart';
import 'package:expenses_app/expesnes_models/expense_model.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _Expenses();
}

class _Expenses extends State<Expenses> {

  final List<Expense> _myExpenses = [
    Expense(
      title: 'Valentine Dinner',
      amount: 400.00,
      date: DateTime.now(),
      category: Category.experience,
    ),
  ];

  void _openAddExpenseItemOverlay(){
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (modalContext) => NewExpense(onAddExpense: _addExpense),
      );
  }

  void _addExpense(Expense expense){
    setState(() {
      _myExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense){
    final expenseIndex = _myExpenses.indexOf(expense);
    setState(() {
      _myExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Expense Delted!"),
      duration: const Duration(seconds: 4),
      action: SnackBarAction(
        label: "Undo", 
        onPressed: () {
          setState(() {
            _myExpenses.insert(expenseIndex, expense);
          });
        }),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainScreenContent = const Center(
      child: Text('No Expenses here... Add some using the + sign.'),
    );
    if(_myExpenses.isNotEmpty){
      mainScreenContent = ExpensesList(
        allExpenses: _myExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses Tracker!"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseItemOverlay, 
            icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          const Text("Expenses go here!"),
          const SizedBox(width: 40,),
          Expanded(child: mainScreenContent,)
        ],
      ),
    );
  }
}