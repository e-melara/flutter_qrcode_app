import 'package:flutter/material.dart';
import 'package:qrcodeapp/src/models/scan.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Scan scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas Qr'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Text(scan.getLanLng()),
      ),
    );
  }
}
