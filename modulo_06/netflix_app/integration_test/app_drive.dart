import 'dart:io';

import 'package:integration_test/integration_test_driver.dart';
import 'package:path/path.dart';

Future<void> main() async {
  final envVars = Platform.environment;
  const appID = 'com.example.netflix_app';
  final permissions = [
    'android.permission.INTERNET',
    'android.permission.ACCESS_NETWORK_STATE',
    'android.permission.USE_BIOMETRIC',
    'android.permission.POST_NOTIFICATIONS',
    'android.permission.RECEIVE_BOOT_COMPLETED',
    'android.permission.VIBRATE',
    'android.permission.SYSTEM_ALERT_WINDOW',
    'android.permission.ACCESS_NOTIFICATION_POLICY',
    'android.permission.CAMERA',
  ];

  final adbPath = join(
    envVars['ANDROID_SDK_ROOT'] ?? envVars['ANDROID_HOME'] ?? '',
    'platform-tools',
    Platform.isWindows ? 'adb.exe' : 'adb',
  );

  await Future.forEach(permissions, (permission) async {
    await Process.run(adbPath, ['shell', 'pm', 'grant', appID, permission]);
  });

  integrationDriver();
}
