import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:items_list/features/home/presentation/home_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        fontFamily: "Roboto",
      ),
      home: const HomeScreen(),
    );
  }
}
