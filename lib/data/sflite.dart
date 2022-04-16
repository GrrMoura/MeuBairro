import 'package:ache_facil/models/favorite_model.dart';
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
      id INTEGER PRIMARY KEY AUTOINCREMENT,idItem INTEGER,
      name TEXT,profession TEXT,city TEXT,state TEXT,district TEXT,
      photo TEXT,phone TEXT,email TEXT,instagram TEXT,facebook TEXT,whatsapp TEXT
    
      );
      
     ''');
  }

  Future insertTermo(Historico historico) async {
    final db = await database;
    await db.insert('historico', historico.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future insertFavorite(FavoriteModel favoriteModel) async {
    final db = await database;
    await db.insert('historico', favoriteModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<FavoriteModel>> getFavorites() async {
    final db = await database;
    List<Map<String, dynamic>> favorites =
        await db.query('historico', orderBy: 'id DESC');

    return List.generate(
        favorites.length,
        (i) => FavoriteModel(
              idItem: favorites[i]['id'],
              name: favorites[i]['name'],
              profession: favorites[i]['profession'],
              photo: favorites[i]['photo'],
              state: favorites[i]['state'],
              district: favorites[i]['district'],
              city: favorites[i]['city'],
              email: favorites[i]['email'],
              phone: favorites[i]['phone'],
              facebook: favorites[i]['facebook'],
              instaram: favorites[i]['instagram'],
              whatsapp: favorites[i]['whatsapp'],
            ));
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
