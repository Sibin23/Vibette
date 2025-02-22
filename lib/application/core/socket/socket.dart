import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  io.Socket socket = io.io(
      '10.0.2.2',
      io.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build());
}

