import 'package:exenses_tracker_flutter/card_transaction.dart';
import 'package:exenses_tracker_flutter/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() async {
  await initializeDateFormatting();
  Intl.defaultLocale = 'ru';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
      id: 't1',
      title: 'Хлеб',
      amount: 40.50,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Молоко',
      amount: 70,
      date: DateTime.now(),
    ),
  ];

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Куда они исчезли?'),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 5,
              color: Colors.purple,
              shadowColor: Colors.purple,
              child: Text('CHART'),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ...transaction.map((tr) => CardTransaction(title: tr.title, amount: tr.amount, date: tr.date)),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
