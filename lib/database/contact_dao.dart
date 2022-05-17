import 'package:sqflite/sqflite.dart';

import '../models/contact.dart';
import 'app_database.dart';

class ContactDao {
  static const String tableSql = 'CREATE TABLE contacts('
      'id INTEGER PRIMARY KEY AUTOINCREMENT, '
      'name TEXT, '
      'account_number INTEGER)';
  static const String _tableName = 'contacts';

  Future<int> save(Contact contact) async {
    final Database db = await createDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);

    return db.insert('contacts', contactMap);
  }

  Future<List<Contact>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query('contacts');
    return _toList(result);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = {};
    contactMap['id'] = contact.id;
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return contactMap;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row['name'],
        row['account_number'],
        row['id'],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
