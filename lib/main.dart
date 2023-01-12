import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yummify/yummify_app.dart';
import 'app/app.locator.dart';
import 'models/models.dart';
import 'setup_dialog.dart';
import 'shared/shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// METHOD 1. To solve HandshakeException: Handshake error in client CERTIFICATE_VERIFY_FAILED issue
  HttpOverrides.global = MyHttpOverrides();

  // /// METHOD 2. To solve HandshakeException: Handshake error in client CERTIFICATE_VERIFY_FAILED issue
  // ByteData data =
  //     await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  // SecurityContext.defaultContext
  //     .setTrustedCertificatesBytes(data.buffer.asUint8List());

  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<HiveMeal>(HiveMealAdapter());
  Hive.registerAdapter<HiveTable>(HiveTableAdapter());
  setupLocator(); // STACKED init setup for locators
  setupDialog();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      startLocale: const Locale('en', 'US'), // Overrides device locale.
      supportedLocales: const [Locale('en', 'US'), Locale('ru', 'RU')],
      fallbackLocale: const Locale('en', 'US'),
      child: const YummifyApp(),
    ),
  );
}
