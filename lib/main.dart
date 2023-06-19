import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:items_list/application.dart';
import 'package:items_list/common/di/init_di.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(EasyLocalization(
      supportedLocales: const [
        Locale('ru'),
      ],
      path: 'assets/strings',
      fallbackLocale: const Locale('ru'),
      child: const Application(),
    ));
  });
}
