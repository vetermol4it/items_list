import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:items_list/internal/application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
        EasyLocalization(
          supportedLocales: [Locale('ru'),],
          path: 'assets/strings',
          fallbackLocale: Locale('ru'),
          child: Application(),
        )
    );
  });
}