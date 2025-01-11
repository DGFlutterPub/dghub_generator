import '../../../config/global.dart';
import '../../../system/services/socket_client_services.dart';
import '../models/auth.dart';

class AuthSocket {
  final _socket = SocketClientServices.socket('auth');


}
