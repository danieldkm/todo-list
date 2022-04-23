import 'package:flutter_todo_list/app/core/database/migrations/migration.dart';
import 'package:sqflite/sqflite.dart';

class MigrationV2 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('craete tanle teste(id integer)');
  }

  @override
  void update(Batch batch) {
    batch.execute('craete tanle teste(id integer)');
  }
}
