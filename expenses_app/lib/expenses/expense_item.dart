

import 'package:expenses_app/expesnes_models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {

const ExpenseItem(this.expense, {super.key});

final Expense expense;

@override
  Widget build(context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        child: 
         Column(children: [
              Text(expense.title),
              Row(
                children: [
                  Text('\$${expense.amount.toStringAsFixed(2)}'),
                  const Spacer(),
                  Row(children: [
                    
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 10),
                    Text(expense.formattedDate),
                  ],),
                ],
              )

          ],)
      ),
    );

  }


}