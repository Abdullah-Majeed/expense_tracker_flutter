import 'package:expense_tracker/widgets/expense_widgets/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.removeExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) removeExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(1.0),
            // margin: EdgeInsets.symmetric(
            //   horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            // ),
            margin: Theme.of(context).cardTheme.margin,
          ),
          key: ValueKey(expenses[index]),
          onDismissed: (direction) => removeExpense(expenses[index]),
          child: ExpenseItem(expense: expenses[index])),
    );
  }
}
