// import 'package:socket_io_client/socket_io_client.dart';
// import '/utils/utils.dart';

// class SocketServices {
//   static final SocketServices instance = SocketServices._init();
//   static Socket? _socket;
//   SocketServices._init();

//   Socket get socket {
//     if (_socket != null) return _socket!;
//     _socket = io(AppConstant.baseUrl,
//         OptionBuilder().setTransports(['websocket']).build());
//     _socket!.io.options!['extraHeader'] = {
//       HttpHeaders.authorizationHeader: LocalStorage.instance.getToken()
//     };
//     return _socket!;
//   }

//   void disconnect() {
//     if (socket.active) {
//       socket.disconnect();
//     }
//   }

//   void connectAndListen() {
//     if (!socket.active) {
//       socket
//         ..disconnect()
//         ..connect();
//     }
//     int userId = LocalStorage.instance.getId();
//     socket.auth = {'userId': userId};
//     socket.onConnect((data) {
//       socket.emit(
//         'user',
//         {'id': LocalStorage.instance.getId(), 'socketId': socket.id},
//       );
//       debugPrint('Success => Socket Connected');
//     });
//     socket.onError((data) => debugPrint('Error => $data'));
//     socket.onDisconnect((data) => debugPrint('Disconnected'));
//     socket.on('user', (data) => performUserAction(data));
//   }

//   void performUserAction(Map data) {
//     switch (data['action']) {
//       case 'deactivate':
//         LocalStorage.instance.setLoggedIn(false);
//         routes.routerDelegate.navigatorKey.currentContext!
//             .goNamed(LoginScreen.name);
//         break;
//       default:
//     }
//   }
// }
