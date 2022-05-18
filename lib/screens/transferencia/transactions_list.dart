import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/contact.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions = [];

  @override
  Widget build(BuildContext context) {
    transactions.add(Transaction(100.0, Contact('Alex', 1000)));
    transactions.add(Transaction(300.0, Contact('Dave', 1000)));
    transactions.add(Transaction(150.0, Contact('Michael', 1000)));

    return Scaffold(
      appBar: AppBar(title: Text('Transactions')),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Transaction transaction = transactions[index];

          return Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text(
                transaction.value.toString(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                transaction.contact.accountNumber.toString(),
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}

class Transaction {
  final double value;
  final Contact contact;

  Transaction(this.value, this.contact);

  @override
  String toString() {
    return 'Transaction{value:$value , contact:$contact}';
  }
}
