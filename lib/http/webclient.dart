import 'dart:convert';

import 'package:bytebank/http/http_interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';

import '../models/contact.dart';
import '../screens/transferencia/transactions_list.dart';

final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
);

final Uri baseUrl = Uri.http('192.168.1.9:8080', 'transactions');

Future<List<Transaction>> findAll() async {
  final Response response =
      await client.get(baseUrl).timeout(const Duration(seconds: 5));

  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<Transaction> transactions = [];
  for (Map<String, dynamic> transactionJson in decodedJson) {
    final Map<String, dynamic> contactJson = transactionJson['contact'];
    final Transaction transaction = Transaction(
      transactionJson['value'],
      Contact(
        contactJson['name'],
        contactJson['accountNumber'],
        contactJson['id'],
      ),
    );
    transactions.add(transaction);
  }
  return transactions;
}

Future<Transaction> save(Transaction transaction) async {
  final Map<String, dynamic> transactionMap = {
    'value': transaction.value,
    'contact': {
      'name': transaction.contact.name,
      'accountNumber': transaction.contact.accountNumber
    }
  };

  final String transactionJson = jsonEncode(transactionMap);

  final Response response = await client.post(baseUrl,
      headers: {'Content-type': 'application/json', 'password': '1000'},
      body: transactionJson);

  Map<String, dynamic> json = jsonDecode(response.body);
  final Map<String, dynamic> contactJson = json['contact'];
  return Transaction(
    json['value'],
    Contact(
      contactJson['name'],
      contactJson['accountNumber'],
    ),
  );
}
