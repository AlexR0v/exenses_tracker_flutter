import 'package:flutter/material.dart';

class CardTransactionAvatar extends StatelessWidget {
  const CardTransactionAvatar({
    Key? key,
    required this.amount,
  }) : super(key: key);

  final double amount;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
