import 'package:exenses_tracker_flutter/card_transaction.dart';
import 'package:exenses_tracker_flutter/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({Key? key, required this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: transactions.isEmpty
            ? Column(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Center(
                      child: Text(
                        'Нет данных :(',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      width: 80,
                      height: 80,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return CardTransaction(
                      title: transactions[index].title,
                      amount: transactions[index].amount,
                      date: transactions[index].date);
                },
                itemCount: transactions.length,
              ),
      ),
    );
  }
}
