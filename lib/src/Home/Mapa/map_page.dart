import 'package:flutter/material.dart';

import 'package:qrcodeapp/src/models/scan.dart';
import 'package:qrcodeapp/src/Home/blocs/scans_bloc.dart';

class MapPage extends StatelessWidget {
  final ScansBloc _scansBloc = new ScansBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _scansBloc.stream,
      builder: (BuildContext context, AsyncSnapshot<List<Scan>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final listScan = snapshot.data;
        if (listScan.length == 0) {
          return Center(child: Text('No hay registros por el momento'));
        }
        return ListView.builder(
          itemCount: listScan.length,
          itemBuilder: (BuildContext context, int index) {
            final item = listScan.elementAt(index);
            return Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.redAccent,
              ),
              onDismissed: (direccion) => _scansBloc.deleteById(item),
              child: ListTile(
                leading: Icon(
                  Icons.cloud_queue,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(item.valor),
                subtitle: Text('ID: ${item.id}'),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
