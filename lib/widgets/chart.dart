import 'package:exenses_tracker_flutter/transaction.dart';
import 'package:exenses_tracker_flutter/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
    required this.recentTransactions,
  }) : super(key: key);

  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {'day': DateFormat.E().format(weekDay).substring(0, 2), 'amount': totalSum};
    });
  }

  double get maxSpending {
    return groupedTransactionsValues.fold(
        0, (previousValue, element) => previousValue + double.parse(element['amount'].toString()));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionsValues
                .map(
                  (data) => Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(
                      label: data['day'].toString(),
                      spendingAmount: double.parse(data['amount'].toString()),
                      spendingTotal: maxSpending == 0.0 ? 0 : double.parse(data['amount'].toString()) / maxSpending,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
