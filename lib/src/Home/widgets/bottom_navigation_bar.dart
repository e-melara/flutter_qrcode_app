import 'package:flutter/material.dart';

class BarNavigationBottom extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;
  const BarNavigationBottom({@required this.pageIndex, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: this.pageIndex,
      onTap: this.onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Mapas'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_5),
          title: Text('Direcciones'),
        )
      ],
    );
  }
}
