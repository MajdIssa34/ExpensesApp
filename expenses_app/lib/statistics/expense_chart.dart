import 'package:expenses_app/expesnes_models/expense_model.dart';
import 'package:expenses_app/statistics/char_bar.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpensesContainer> get individualExpenses {
    return [
      ExpensesContainer.forCategory(expenses, Category.food),
      ExpensesContainer.forCategory(expenses, Category.accomodation),
      ExpensesContainer.forCategory(expenses, Category.experience),
      ExpensesContainer.forCategory(expenses, Category.shopping)
    ];
  }

  double getHighestExpesne() {
    double high = 0;
    for (final category in individualExpenses) {
      if (category.sumOfExpenses > high) {
        high = category.sumOfExpenses;
      }
    }
    return high;
  }

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.secondary,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (final categoryExpense in individualExpenses)
                ChartBar(proportion: categoryExpense.sumOfExpenses==0 ? 0: categoryExpense.sumOfExpenses/getHighestExpesne()),
            ],
          )),
          const SizedBox(width: 20,),
          Row(
            children: individualExpenses.map(
              (individualExpense) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(
                    categoryIcons[individualExpense.category],
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )),
                ).toList()
          )
        ],
      ),
    );
  }
}
