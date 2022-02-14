import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get_it/get_it.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:items_list/data/api/api_util.dart';
import 'package:items_list/data/api/service/item_generator_service.dart';
import 'package:items_list/domain/repository/item_repository.dart';
import 'package:items_list/data/repository/item_data_repository.dart';
import 'package:items_list/domain/bloc/item_generator_bloc.dart';
import 'package:items_list/application.dart';


GetIt getIt = GetIt.instance;

void main() async {
  _registerDependencies();
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

void _registerDependencies(){
  getIt.registerSingleton<ItemGeneratorService>(ItemGeneratorService());
  getIt.registerSingleton<ApiUtil>(ApiUtil(getIt<ItemGeneratorService>()));
  getIt.registerSingleton<ItemRepository>(ItemDataRepository(getIt<ApiUtil>()));
  getIt.registerSingleton(ItemGeneratorBloc(getIt<ItemRepository>()));
}