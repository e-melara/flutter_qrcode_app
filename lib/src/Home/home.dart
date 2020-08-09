import 'package:flutter/material.dart';
import 'package:qrcodeapp/src/Home/Direccion/direccion_page.dart';
import 'package:qrcodeapp/src/Home/Mapa/map_page.dart';
import './widgets/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageCurrent = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QrCode app'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.delete_forever), onPressed: () {})
        ],
      ),
      body: routePageNavigationCall(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
        return new MapPage();
      case 1:
        return new DireccionPage();
      default:
        return new MapPage();
    }
  }
}
