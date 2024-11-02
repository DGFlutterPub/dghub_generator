import 'dart:convert';

import 'package:encrypt_shared_preferences/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:socket_io_client/socket_io_client.dart';

import '../../config/global.dart';
import '../../gen/auth/models/auth.dart';

class SocketClientServices {
  static io.Socket socket(String of) {
    final EncryptedSharedPreferences box =
        EncryptedSharedPreferences.getInstance();
    String? token;
    try {
      token = Auth.fromJson(jsonDecode(box.getString('Auth')!)).token;
    } catch (e) {
      token = null;
    }

    var socket = io.io(
        '$hostUrl/$of',
        OptionBuilder()
            .setTransports(["websocket"])
            // .disableAutoConnect()
            .enableForceNewConnection()
            // .enableReconnection()
            .setExtraHeaders({
              'authentication': 'Bearer $token',
              'Connection': 'upgrade',
              'Upgrade': 'websocket',
              'foo': 'bar'
            })
            .build());
    socket.connect();

    socket.onConnect((data) {
      socket.emit('connection', 'Bearer $token');

      if (kDebugMode) {
        logger.i('[${of.toUpperCase()}-SOCKET] CONNECTED: $data');
      }
    });
    socket.onConnectError((data) {
      if (kDebugMode) {
        logger.e("[${of.toUpperCase()}-SOCKET] ERROR: ",
            error: data.toString());
      }
    });

    return socket;
  }
}
