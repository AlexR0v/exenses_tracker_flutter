import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final void Function(String, double, DateTime) onAddTransaction;

  const NewTransaction({Key? key, required this.onAddTransaction}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleInput = TextEditingController();
  final _amountValue = TextEditingController();
  DateTime? _selectedDate;

  void _onAddNew() {
    final String title = _titleInput.text;
    final double amount = double.parse(_amountValue.text == '' ? '0' : _amountValue.text);
    if (title.isEmpty || amount <= 0) {
      return;
    }
    widget.onAddTransaction(title, amount, _selectedDate ?? DateTime.now());
    _titleInput.text = '';
    _amountValue.text = '';
    Navigator.of(context).pop();
  }

  void _openDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().add(const Duration(days: -6)),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      _selectedDate = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _titleInput,
                onSubmitted: (_) => _onAddNew,
                decoration: const InputDecoration(
                  labelText: 'Покупка',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _amountValue,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _onAddNew,
                decoration: const InputDecoration(
                  labelText: 'Стоимость',
                  suffixText: '₽',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedDate == null
                        ? 'Дата не выбрана'
                        : DateFormat('EE, d MMMM').format(_selectedDate ?? DateTime.now()),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: _openDatePicker,
                    child: Text(
                      'Выбрать дату',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _onAddNew,
              child: const Text('Добавить транзакцию'),
            )
          ],
        ),
      ),
    );
  }
}
