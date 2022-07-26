import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final void Function(String, double) onAddTransaction;

  const NewTransaction({Key? key, required this.onAddTransaction}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleInput = TextEditingController();

  final _amountValue = TextEditingController();

  void onAddNew() {
    final String title = _titleInput.text;
    final double amount = double.parse(_amountValue.text == '' ? '0' : _amountValue.text);
    if (title.isEmpty || amount <= 0) {
      return;
    }
    widget.onAddTransaction(title, amount);
    _titleInput.text = '';
    _amountValue.text = '';
    Navigator.of(context).pop();
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
                onSubmitted: (_) => onAddNew,
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
                onSubmitted: (_) => onAddNew,
                decoration: const InputDecoration(
                  labelText: 'Стоимость',
                  suffixText: '₽',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: onAddNew,
              child: const Text('Добавить'),
            )
          ],
        ),
      ),
    );
  }
}
