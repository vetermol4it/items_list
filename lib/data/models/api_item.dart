class ApiItem {
  static const _idKey = 'id';
  static const _imageUrlKey = 'imageUrl';
  static const _titleKey = 'title';


  final int id;
  final String imageUrl;
  final String title;

  ApiItem({
    required this.id,
    required this.imageUrl,
    required this.title,
  });

  ApiItem.fromMap(Map<String,dynamic> map):
    id = map[_idKey],
    imageUrl = map[_imageUrlKey],
    title = map[_titleKey];

  Map<String, dynamic> toMap(){
    return {
      _idKey : id,
      _imageUrlKey : imageUrl,
      _titleKey : title,
    };
  }
}