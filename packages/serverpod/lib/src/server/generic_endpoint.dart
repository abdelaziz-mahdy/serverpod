import 'package:serverpod/database.dart';
import 'package:serverpod/src/server/endpoint.dart';
import 'package:serverpod/src/server/session.dart';

abstract class GenericEndpoint<T extends TableRow> extends Endpoint {
  Future<T> create(Session s, T row) async {
    return await s.db.insertRow<T>(row);
  }

  Future<T> update(Session s, T row) async {
    return await s.db.updateRow<T>(row);
  }

  Future<T> delete(Session s, T row) async {
    return await s.db.deleteRow<T>(row);
  }

  Future<T?> get(Session s, int id) async {
    return await s.db.findById<T>(id);
  }

  Future<List<T>> getAll(Session s) async {
    return await s.db.find();
  }
}
