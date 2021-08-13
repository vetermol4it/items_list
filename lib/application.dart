import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:items_list/presentation/home_screen/home_screen.dart';


class Application extends StatelessWidget {

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
      home: HomeScreen(),
    );
  }
}