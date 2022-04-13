// import 'package:ache_facil/data/sflite.dart';
// import 'package:ache_facil/models/historico_model.dart';
// import 'package:sqflite/sqlite_api.dart';

// class HistoricoDao {
//   static const String tableSql = 'CREATE TABLE $_tableName('
//       '$_id INTEGER PRIMARY KEY, '
//       '$_name TEXT,';
//   static const String _tableName = 'historico';
//   static const String _id = 'id';
//   static const String _name = 'name';

//   Future<int> save(Historico historico) async {
//     final Database db = await getDatabase();
//     Map<String, dynamic> historicoMap = _toMap(historico);
//     return db.insert(_tableName, historicoMap);
//   }

//   Future<List<Historico>> findAll() async {
//     final Database db = await getDatabase();
//     final List<Map<String, dynamic>> result = await db.query(_tableName);
//     List<Historico> termos = _toList(result);
//     return termos;
//   }

//   Map<String, dynamic> _toMap(Historico historico) {
//     final Map<String, dynamic> historicoMap = {};
//     historicoMap[_name] = historico.name;

//     return historicoMap;
//   }

//   List<Historico> _toList(List<Map<String, dynamic>> result) {
//     final List<Historico> termos = [];
//     for (Map<String, dynamic> row in result) {
//       final Historico contact = Historico(
//         row[_id],
//         row[_name],
//       );
//       termos.add(contact);
//     }
//     return termos;
//   }
// }
