import 'package:ache_facil/models/historico_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseConnect {
  Database? _database;
  Future<Database> get database async {
    final String dbpath = await getDatabasesPath();
    const dbname = "historico.db";
    final path = join(dbpath, dbname);
    _database = await openDatabase(path, version: 1, onCreate: _createDB);

    return _database!;
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''CREATE TABLE historico(
      id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT
      )
     ''');
  }

  Future insertTermo(Historico historico) async {
    final db = await database;
    await db.insert('historico', historico.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Historico>> getHistorico() async {
    final db = await database;
    List<Map<String, dynamic>> termos =
        await db.query('historico', orderBy: 'id DESC');

    return List.generate(termos.length,
        (i) => Historico(id: termos[i]['id'], name: termos[i]['name']));
  }

  Future<void> deletarTermo(Historico termo) async {
    final db = await database;
    await db.delete('historico', where: 'id==?', whereArgs: [termo.id]);
  }
}
