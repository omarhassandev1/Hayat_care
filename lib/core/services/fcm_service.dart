import 'package:firebase_messaging/firebase_messaging.dart';

// This runs in background when app is closed — must be top-level function
@pragma('vm:entry-point')
Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
  // system already shows the notification, nothing to do here for now
}

class FCMService {
  final _messaging = FirebaseMessaging.instance;

  Future<void> init() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);

    await _messaging.requestPermission();

    final token = await _messaging.getToken();
    print('FCM Token: $token');

    FirebaseMessaging.onMessage.listen((message) {
      print('Foreground message: ${message.notification?.title}');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _handleNavigation(message.data);
    });

    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleNavigation(initialMessage.data);
    }

    _messaging.onTokenRefresh.listen((newToken) {
      // TODO: call your backend with the new token
    });
  }

  void _handleNavigation(Map<String, dynamic> data) {
    final type = data['type'];
    switch (type) {
      case 'new_appointment':
        break;
      case 'appointment_reminder':
        break;
    }
  }
}