import '../../../config/global.dart';
import '../../../system/services/socket_client_services.dart';
import '../models/auth.dart';

class AuthSocket {
  final _socket = SocketClientServices.socket('auth');

  register({required Function(Auth) result}) {
    if (!_socket.hasListeners('register')) {
      _socket.on('register', (response) {
        try {
          result(Auth.fromJson(response));
        } catch (e) {
          logger.e(e);
          throw 'Register socket error';
        }
      });
    }
  }

  login({required Function(Auth) result}) {
    if (!_socket.hasListeners('login')) {
      _socket.on('login', (response) {
        try {
          result(Auth.fromJson(response));
        } catch (e) {
          logger.e(e);
          throw 'Login socket error';
        }
      });
    }
  }


}
