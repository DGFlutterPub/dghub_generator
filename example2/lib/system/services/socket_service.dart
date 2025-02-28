import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  IO.Socket? socket;

  void initializeSocket() {
    socket = IO.io('http://localhost:3000', <String, dynamic>{
      'transports': ['websocket'],
    });

    socket?.on('sync-update', (data) {
      print('Data received from server: $data');
      // Handle real-time sync here (e.g., update local database)
    });
  }

  void sendDataToServer(Map<String, dynamic> product) {
    socket?.emit('sync', product); // Send data to server
  }
}
