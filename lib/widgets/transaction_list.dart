import 'package:exenses_tracker_flutter/models/transaction.dart';
import 'package:exenses_tracker_flutter/widgets/card_transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key, required this.transactions, required this.onDeleteTransaction}) : super(key: key);

  final List<Transaction> transactions;
  final void Function(String) onDeleteTransaction;

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
                    key: ValueKey(transactions[index].id),
                    title: transactions[index].title,
                    amount: transactions[index].amount,
                    date: transactions[index].date,
                    id: transactions[index].id,
                    onDeleteTransaction: onDeleteTransaction,
                  );
                },
                itemCount: transactions.length,
              ),
      ),
    );
  }
}
