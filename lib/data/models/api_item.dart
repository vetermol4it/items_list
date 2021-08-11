class ApiItem {
  static const _id_key = 'id';
  static const _imageUrl_key = 'imageUrl';
  static const _title_key = 'title';


  final int id;
  final String imageUrl;
  final String title;

  ApiItem({
    required this.id,
    required this.imageUrl,
    required this.title,
  });

  ApiItem.fromMap(Map<String,dynamic> map):
    this.id = map[_id_key],
    this.imageUrl = map[_imageUrl_key],
    this.title = map[_title_key];

  Map<String, dynamic> toMap(){
    return {
      _id_key : this.id,
      _imageUrl_key : this.imageUrl,
      _title_key : this.title,
    };
  }
}