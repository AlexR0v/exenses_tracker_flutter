import 'package:exenses_tracker_flutter/widgets/card_transaction_avatar.dart';
import 'package:exenses_tracker_flutter/widgets/card_transaction_title.dart';
import 'package:flutter/material.dart';

class CardTransaction extends StatelessWidget {
  const CardTransaction({
    required Key key,
    required this.title,
    required this.amount,
    required this.date,
    required this.onDeleteTransaction,
    required this.id,
  }) : super(key: key);

  final String title;
  final DateTime date;
  final double amount;
  final String id;
  final void Function(String) onDeleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CardTransactionAvatar(amount: amount),
                  CardTransactionTitle(title: title, date: date),
                ],
              ),
              IconButton(
                onPressed: () => onDeleteTransaction(id),
                color: Theme.of(context).errorColor,
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ));
  }
}
