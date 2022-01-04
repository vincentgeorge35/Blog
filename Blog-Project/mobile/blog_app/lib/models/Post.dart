class Post {
  int id = 0;
  String author = '';
  DateTime date = DateTime.now();
  String title = '';
  String body = '';

  Post(
      {required this.id,
      required this.author,
      required this.date,
      required this.title,
      required this.body});
}

List<Post> posts = [
  Post(
      id: 1,
      author: 'John Doe',
      date: DateTime.now(),
      title: 'Lorem Ipsum',
      body:
          'Shebrand was birthed to raise African women to become 3G; global voices, godly vessels and guaranteed successes. The average African woman is trained to be silent and never heard. Meanwhile she might have the potentials to change the globe.'),
  Post(
      id: 2,
      author: 'Steve Hew',
      date: DateTime.now(),
      title: 'Dolor Sunt',
      body:
          'Although this is gradually changing, we exist to raise more balanced women who will get to the climax of their dreams regardless of their culture, tribe, color or background. We want to raise these exceptional women to be global answers yet balanced women.'),
  Post(
      id: 3,
      author: 'R. Lukaku',
      date: DateTime.now(),
      title: 'Tinkum Amet',
      body:
          'In the last two years, we have had impactful conferences that have changed about 230 ladies in Ebonyi and we have followed up on some of them who required mentorship every two weeks on a Shebrand platform where books, talks and many more are given to them.'),
  Post(
      id: 4,
      author: 'Pulisic',
      date: DateTime.now(),
      title: 'Atesunt Jume',
      body:
          'To raise African women to be passionate about their dreams and to fulfill their dreams regardless of their past, their current challenges or any form of pressure they are faced with.'),
  Post(
      id: 5,
      author: 'Chelsea',
      date: DateTime.now(),
      title: 'Atesunt Jume',
      body:
          'To raise African women to be passionate about their dreams and to fulfill their dreams regardless of their past, their current challenges or any form of pressure they are faced with.'),
  Post(
      id: 6,
      author: 'Man City',
      date: DateTime.now(),
      title: 'Atesunt Jume',
      body:
          'To raise African women to be passionate about their dreams and to fulfill their dreams regardless of their past, their current challenges or any form of pressure they are faced with.'),
];
