import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

import 'models/contact.dart';

void main() {
  runApp(const Bytebank());

  WidgetsFlutterBinding.ensureInitialized();

  save(Contact(4, 'Liana', 23000)).then((id) {
    debugPrint('Id: $id');
  });
  /*  save(
    Transaction(
      12350.0,
      const Contact(id: 0, name: 'Fulano', accountNumber: 8500),
    ),
  ).then((transaction) {
    debugPrint('transaction: $transaction');
  }); */
   findAll().then((transactions) {
    debugPrint('transactions: $transactions');
  });
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
