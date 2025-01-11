import '../../../config/global.dart';
import '../../../system/services/socket_client_services.dart';
import '../models/product.dart';

class ProductSocket {
  final _socket = SocketClientServices.socket('product');

  store({required Function(Product) result}) {
    if (!_socket.hasListeners('store')) {
      _socket.on('store', (response) {
        try {
          result(Product.fromJson(response));
        } catch (e) {
          logger.e(e);
          throw 'Store socket error';
        }
      });
    }
  }


}
