// import 'package:flutter/foundation.dart';

class InterView {

  late String url;
  late String age;
  late String name;
  late String job;
  late String vedioUrl;

  InterView({
    required this.url,
    required this.age,
    required this.name,
    required this.job,
    required this.vedioUrl,
  });

  factory InterView.fromJson(Map<String, dynamic> json) => InterView(
    url: json["url"],
    age: json["age"],
    name: json["name"],
    job: json["job"],
    vedioUrl : json["vedioUrl"]
  );

  // Map<String, dynamic> toJson() => {
  //   "url": url,
  //   "age": age,
  //   "name": name,
  //   "job":job,
  // };

}