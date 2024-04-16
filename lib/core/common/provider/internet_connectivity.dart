import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ConnectivityStatus { notDetermined, isConnected, isDisconnected }

final connectivityStatusProvider =
    StateNotifierProvider<ConnectivityStatusNotifier, ConnectivityStatus>(
  (ref) => ConnectivityStatusNotifier(),
);

class ConnectivityStatusNotifier extends StateNotifier<ConnectivityStatus> {
  late ConnectivityStatus lastResult;
  late ConnectivityStatus newState;

  ConnectivityStatusNotifier() : super(ConnectivityStatus.notDetermined) {
    lastResult = ConnectivityStatus.notDetermined;
    initConnectivity();
  }

  Future<void> initConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      newState = ConnectivityStatus.isConnected;
    } else {
      newState = ConnectivityStatus.isDisconnected;
    }
    if (newState != lastResult) {
      state = newState;
      lastResult = newState;
    }
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        newState = ConnectivityStatus.isConnected;
      } else {
        newState = ConnectivityStatus.isDisconnected;
      }
      if (newState != lastResult) {
        state = newState;
        lastResult = newState;
      }
    });
  }
}
