import 'package:bytebank/screens/dashboard.dart';
import 'package:bytebank/screens/transferencia/transactions_list.dart';
import 'package:flutter/material.dart';

import 'http/webclient.dart';
import 'models/contact.dart';

void main() {
  runApp(const Bytebank());
}

class Bytebank extends StatelessWidget {
  const Bytebank({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bytebank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green[900] ?? Colors.green,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.greenAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
