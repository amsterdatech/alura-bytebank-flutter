import 'package:bytebank/components/centered_message.dart';
import 'package:bytebank/http/webclient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/contact.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions = [];

  @override
  Widget build(BuildContext context) {
    // transactions.add(Transaction(100.0, Contact('Alex', 1000)));
    // transactions.add(Transaction(300.0, Contact('Dave', 1000)));
    // transactions.add(Transaction(150.0, Contact('Michael', 1000)));

    return Scaffold(
      appBar: AppBar(title: Text('Transactions')),
      // body: ListView.builder(
      //   itemBuilder: (context, index) {
      //     final Transaction transaction = transactions[index];
      //
      //     return Card(
      //       child: ListTile(
      //         leading: Icon(Icons.monetization_on),
      //         title: Text(
      //           transaction.value.toString(),
      //           style: TextStyle(
      //             fontSize: 24,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //         subtitle: Text(
      //           transaction.contact.accountNumber.toString(),
      //           style: TextStyle(
      //             fontSize: 16.0,
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      //   itemCount: transactions.length,
      // ),
      body: FutureBuilder(
        future: Future.delayed(Duration(seconds: 1)).then((value) => findAll()),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:

              if(snapshot.hasData) {
                final List<Transaction> transactions = snapshot.data;

                if(transactions.isNotEmpty){
                  return ListView.builder(
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
                  );
                }

                return CenteredMessage('No transactions found',icon:Icons.warning);
              }
              break;
          }
          return CenteredMessage('Unknown error');
        },
      ),
    );
  }
}

class Progress extends StatelessWidget {
  final String message;

  Progress({this.message = 'Loading'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Text(message),
        ],
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
