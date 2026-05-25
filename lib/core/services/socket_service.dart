import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {

  late io.Socket socket;

  void connect() {

    socket = io.io(
      'http://10.0.2.2:5000',
      io.OptionBuilder()
          .setTransports(['websocket'])
          .build(),
    );

    socket.connect();

  }

  void sendMessage(String message) {

    socket.emit('send_message', {
      'message': message,
    });

  }

}