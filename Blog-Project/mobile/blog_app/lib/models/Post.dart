class Post {
  int id = 0;
  String date = '';
 
 String author = '';
  String title = '';
  String body = '';

  Post(
      {required this.id,
      required this.author,
      required this.date,
      required this.title,
      required this.body});

  // factory
  Post.fromJson(Map<String, dynamic> json) {
    id = json["Id"];
    date = json["CreatedAt"];
    author = json["Author"];
    title = json["Title"];
    body = json["Body"];
  }
}
