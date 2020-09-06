import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:barcode_scan/barcode_scan.dart';

import 'Mapa/maps_page.dart';
import './blocs/scans_bloc.dart';
import './Direccion/direccion_page.dart';
import './widgets/bottom_navigation_bar.dart';
import 'package:qrcodeapp/src/models/scan.dart';
import 'package:qrcodeapp/src/utils.dart' as utils;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageCurrent = 0;
  final ScansBloc _scansBloc = new ScansBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QrCode app'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              _scansBloc.deleteAll();
            },
          )
        ],
      ),
      body: routePageNavigationCall(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onScanCamera(context);
        },
        child: Icon(Icons.filter_center_focus),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BarNavigationBottom(
        pageIndex: this.pageCurrent,
        onTap: (int index) {
          setState(() {
            this.pageCurrent = index;
          });
        },
      ),
    );
  }

  Widget routePageNavigationCall() {
    switch (this.pageCurrent) {
      case 0:
        return new MapsPage();
      case 1:
        return new DireccionPage();
      default:
        return new MapsPage();
    }
  }

  void onScanCamera(BuildContext context) async {
    final String resultScan = 'geo:40.724233047051,-74.007314591';

    if (resultScan != null) {
      final _scan = new Scan(valor: resultScan);
      _scansBloc.add(_scan);

      if (Platform.isIOS) {
        Future.delayed(Duration(milliseconds: 750), () {
          utils.openLaunch(_scan, context);
        });
      } else {
        await utils.openLaunch(_scan, context);
      }
    }

    // try {
    //   resultScan = await BarcodeScanner.scan();
    // } catch (e) {
    //   resultScan = e;
    // }

    // print(resultScan);
  }
}
