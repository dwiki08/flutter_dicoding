import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';

Future<Client> sslPinningClient() async {
  final sslCert = await rootBundle.load('certificates/certificates.crt');
  SecurityContext securityContext = SecurityContext(withTrustedRoots: false);
  securityContext.setTrustedCertificatesBytes(sslCert.buffer.asInt8List());

  HttpClient client = await HttpClient(context: await securityContext);
  client.badCertificateCallback =
      (X509Certificate cert, String host, int port) => false;
  return IOClient(client);
}
