import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:qrcodeapp/src/models/scan.dart';

openLaunch(Scan scan, BuildContext context) async {
  if (scan.tipo == 'http') {
    if (await canLaunch(scan.valor)) {
      return await launch(scan.valor);
    }
    return throw 'No se puede abrir ${scan.valor}';
  }

  Navigator.popAndPushNamed(context, "map", arguments: scan);
}
