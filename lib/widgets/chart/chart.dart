import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:expense_tracker/models/expense.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.work),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: PieChart(
              PieChartData(
                centerSpaceRadius: 50,
                sectionsSpace: 2,
                sections: [
                  PieChartSectionData(
                    value: buckets[0].totalExpenses,
                    color: Colors.red,
                    title: 'Food',
                  ),
                  PieChartSectionData(
                    value: buckets[1].totalExpenses,
                    color: Colors.blue,
                    title: 'Leisure',
                  ),
                  PieChartSectionData(
                    value: buckets[2].totalExpenses,
                    color: Colors.green,
                    title: 'Travel',
                  ),
                  PieChartSectionData(
                    value: buckets[3].totalExpenses,
                    color: Colors.orange,
                    title: 'Work',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('🔴 Food'),
              Text('🔵 Leisure'),
              Text('🟢 Travel'),
              Text('🟠 Work'),
            ],
          ),
        ],
      ),
    );
  }
}