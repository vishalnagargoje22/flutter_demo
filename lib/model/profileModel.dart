// class profile {
// int age;
// String dateAdded;
// String filename;
// String gender;
// String imageUrl;
// String lastServed;
// String source;

//   profile({
//      this.age,
//      this.dateAdded,
//      this.filename,
//      this.gender,
//      this.imageUrl,
//      this.lastServed,
//      this.source,
//   });

// profile.fromJson(Map<String, dynamic> json) {
//   age = json["age"];
//   dateAdded = json["dateAdded"];
//   filename = json["filename"];
//   gender = json["gender"];
//   imageUrl = json["imageUrl"];
//   lastServed = json["lastServed"];
//   source=
//   json["source"];
// }
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['age'] = this.age;
//   data['date_added'] = this.dateAdded;
//   data['filename'] = this.filename;
//   data['gender'] = this.gender;
//   data['image_url'] = this.imageUrl;
//   data['last_served'] = this.lastServed;
//   data['source'] = this.source;
//   return data;
// }
// }
class profile {
  int age = 0;
  String dateAdded = "";
  String filename = "";
  String gender = "";
  String imageUrl = "";
  String lastServed = "";
  String source = "";

  profile(this.age, this.dateAdded, this.filename, this.gender, this.imageUrl,
      this.lastServed);
  profile.fromJson(Map<String, dynamic> json) {
    age = json["age"];
    dateAdded = json["dateAdded"];
    filename = json["filename"];
    gender = json["gender"];
    imageUrl = json["imageUrl"];
    lastServed = json["lastServed"];
    source = json["source"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['date_added'] = this.dateAdded;
    data['filename'] = this.filename;
    data['gender'] = this.gender;
    data['image_url'] = this.imageUrl;
    data['last_served'] = this.lastServed;
    data['source'] = this.source;
    return data;
  }
}
