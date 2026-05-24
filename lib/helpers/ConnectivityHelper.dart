import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityHelper {
  static bool isOnline = true;
  static StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  // Global broadcast stream for connectivity changes
  static final StreamController<bool> _connectivityController = StreamController<bool>.broadcast();

  static Stream<bool> get onConnectivityChanged => _connectivityController.stream;

  static Future<void> initialize() async {
    // Check initial connectivity
    final connectivityResults = await Connectivity().checkConnectivity();
    isOnline = connectivityResults.any((result) => result != ConnectivityResult.none);

    // Listen to connectivity changes and broadcast globally
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) {
      isOnline = results.any((result) => result != ConnectivityResult.none);
      _connectivityController.add(isOnline);
    });
  }

  static void dispose() {
    _connectivitySubscription?.cancel();
    _connectivityController.close();
  }
}
