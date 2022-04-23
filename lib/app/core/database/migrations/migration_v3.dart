import 'package:flutter_todo_list/app/core/database/migrations/migration.dart';
import 'package:sqflite/sqflite.dart';

class MigrationV3 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('craete tanle teste2(id integer)');
  }

  @override
  void update(Batch batch) {
    batch.execute('craete tanle teste2(id integer)');
  }
}
