import 'dart:async';
import 'package:qrcodeapp/src/providers/db_provider.dart';

class ScansBloc {
  static final ScansBloc _singleton = new ScansBloc._internal();
  factory ScansBloc() {
    return _singleton;
  }
  ScansBloc._internal() {
    getAll();
  }

  final _scanStreamCtlr = new StreamController<List<Scan>>.broadcast();
  Stream<List<Scan>> get stream => _scanStreamCtlr.stream;

  void getAll() async {
    final all = await DbProvider.db.getAll();
    _scanStreamCtlr.sink.add(all);
  }

  void add(Scan scan) async {
    await DbProvider.db.add(scan);
    getAll();
  }

  deleteAll() async {
    await DbProvider.db.deleteAll();
    getAll();
  }

  deleteById(Scan scan) async {
    await DbProvider.db.deleteById(scan);
    getAll();
  }

  void disponse() {
    _scanStreamCtlr?.close();
  }
}
