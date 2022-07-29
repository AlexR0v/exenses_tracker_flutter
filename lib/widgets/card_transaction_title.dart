import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardTransactionTitle extends StatelessWidget {
  const CardTransactionTitle({
    Key? key,
    required this.title,
    required this.date,
  }) : super(key: key);

  final String title;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
