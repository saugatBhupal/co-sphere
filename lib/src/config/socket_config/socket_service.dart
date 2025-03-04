import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/shared_prefs.dart/user_shared_pref.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  static final SocketService _instance = SocketService._internal();
  IO.Socket? _socket;

  factory SocketService() => _instance;

  SocketService._internal();

  Future<void> initialize() async {
    User? user = await UserSharedPref.getUser();
    String userId = user?.uid ?? 'undefined';

    _socket = IO.io(
      // 'http://10.0.2.2:3000',
      //'http://192.168.101.3:3000',
      'https://a960-2404-7c00-44-f6d-197a-458a-7150-2199.ngrok-free.app',
      // 'http://localhost:3000',
      IO.OptionBuilder()
          .setQuery({'userId': userId})
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build(),
    );

    _socket!.connect();
    _socket!.onConnect((_) {
      print('Connected to Socket Server');
    });

    _socket!.onDisconnect((_) {
      print('Disconnected from Socket Server');
    });

    _socket!.onError((data) {
      print('Socket Error: $data');
    });
  }

  void disconnect() {
    _socket?.disconnect();
  }

  IO.Socket? get socket => _socket;
}
