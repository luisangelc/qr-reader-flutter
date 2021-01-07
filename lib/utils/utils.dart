import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';

import 'package:qr_reader/providers/db_provider.dart';

launchURL(BuildContext context, ScanModel scan) async {
  final url = scan.valor;

  if (scan.tipo == 'http') {
    if (await canLaunch(url))
      await launch(url);
    else
      throw 'Could not launch $url';
  } else {
    // print('geo-location');
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
