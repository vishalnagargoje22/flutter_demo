class Album {
  final int age;
  final String date_added;
  final String filename;
  final String gender;
  final String imageUrl;
  final String last_served;
  final String source;

  Album(
      {required this.age,
      required this.date_added,
      required this.filename,
      required this.gender,
      required this.imageUrl,
      required this.last_served,
      required this.source});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        age: json['age'],
        date_added: json['date_added'],
        filename: json['filename'],
        gender: json['gender'],
        imageUrl: json['image_url'],
        last_served: json['last_served'],
        source: json['source']);
  }
}
