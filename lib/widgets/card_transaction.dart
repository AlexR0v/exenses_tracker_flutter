import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardTransaction extends StatelessWidget {
  const CardTransaction({
    Key? key,
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
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FittedBox(
                            child: Text(
                              (amount % 1 == 0) ? amount.toStringAsFixed(0) : amount.toStringAsFixed(2),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          const Text(
                            '₽',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                      Text(
                        DateFormat('EE, d MMMM').format(date),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
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
