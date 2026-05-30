class Article {
  // di generate constructor nya, jadi pas bikin article baru, kita harus masukin category nya
  final String category;
  final String title;
  final String source;
  final String time;
  final String body;

  Article({
    required this.category,
    required this.title,
    required this.source,
    required this.time,
    required this.body,
  });
}
