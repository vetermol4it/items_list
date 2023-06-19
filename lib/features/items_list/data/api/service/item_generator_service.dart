import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@lazySingleton
class ItemGeneratorService {
  final _uuid = const Uuid();
  final _random = Random();

  final _itemsDictionary = [
    {
      'imageUrl': 'https://pizzafiero.ru/wp-content/uploads/2015/02/05-k.png',
      'title': 'Coca-Cola',
    },
    {
      'imageUrl': 'https://pizzafiero.ru/wp-content/uploads/2020/05/fanta.png',
      'title': 'Fanta',
    },
    {
      'imageUrl': 'https://pizzafiero.ru/wp-content/uploads/2018/02/palpian.png',
      'title': 'Pulpy',
    },
    {
      'imageUrl': 'https://pizzafiero.ru/wp-content/uploads/2020/12/fuzetea.png',
      'title': 'Fuzetea',
    },
  ];

  Map<String, dynamic> generateItem() {
    final newItem = _itemsDictionary[_random.nextInt(4)];
    newItem.addAll({'id': _uuid.v4()});

    return newItem;
  }
}
