import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yummify/yummify_app.dart';
import 'app/app.locator.dart';
import 'firebase_options.dart';
import 'models/models.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // /// METHOD 1. To solve HandshakeException: Handshake error in client CERTIFICATE_VERIFY_FAILED issue
  // HttpOverrides.global = MyHttpOverrides();

  /// METHOD 2. To solve HandshakeException: Handshake error in client CERTIFICATE_VERIFY_FAILED issue
  ByteData data =
      await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());

  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<HiveMeal>(HiveMealAdapter());
  Hive.registerAdapter<HiveTable>(HiveTableAdapter());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator(); // STACKED setup
  // setupDialog();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('en', 'US'), Locale('ru', 'RU')],
      fallbackLocale: const Locale('en', 'US'),
      child: const YummifyApp(),
    ),
  );
}
