import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'contact_dao.dart';

Future<Database> createDatabase() async {
  return openDatabase(
    join(
      await getDatabasesPath(),
      'bytebank.db',
    ),
    onCreate: (db, version) {
      return db.execute(ContactDao.tableSql);
    },
    version: 2,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}
