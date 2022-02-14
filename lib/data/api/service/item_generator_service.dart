import 'dart:math';

class ItemGeneratorService {

  static const _itemsDictionary = [
    {
      'imageUrl' : 'https://pizzafiero.ru/wp-content/uploads/2015/02/05-k.png',
      'title' : 'Coca-Cola',
    },
    {
      'imageUrl' : 'https://pizzafiero.ru/wp-content/uploads/2020/05/fanta.png',
      'title' : 'Fanta',
    },
    {
      'imageUrl' : 'https://pizzafiero.ru/wp-content/uploads/2018/02/palpian.png',
      'title' : 'Pulpy',
    },
    {
      'imageUrl' : 'https://pizzafiero.ru/wp-content/uploads/2020/12/fuzetea.png',
      'title' : 'Fuzetea',
    },
  ];

  int _lastId = 0;


  Map<String, dynamic> generateItemsList() {
    final random = Random();
    final itemsCount = 10000 + random.nextInt(90000);
    final items = List.generate(
      itemsCount,
      (index) {
        Map<String, dynamic> item = {
          'id' : _lastId + 1,
        };
        _lastId++;
        item.addAll(_itemsDictionary[random.nextInt(4)]);
        return item;
      },
    );
    return {
      'items' : items,
    };
  }

  Map<String, dynamic> generateItem() {
    final random = Random();
    Map<String, dynamic> item = {
      'id' : _lastId + 1,
    };
    _lastId ++;
    item.addAll(_itemsDictionary[random.nextInt(4)]);
    return item;
  }
}