class Author {
  int id = 0;
  String firstName = '';
  String lastName = '';
  int age = 0;

  Author(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.age}); // constructor

  // factory
  Author.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    age = json['Age'];
  }
}
