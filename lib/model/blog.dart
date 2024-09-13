class Blog {
  int id;
  String title;
  String body;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  Blog({
    required this.id,
    required this.image,
    required this.title,
    required this.body,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
    id: json["id"],
    image: json["image"],
    title: json["title"],
    body: json["body"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title,
    "body": body,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}