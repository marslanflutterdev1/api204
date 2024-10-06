class PlaceholderApiModelEx1 {
  PlaceholderApiModelEx1({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  PlaceholderApiModelEx1.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        body = json['body'];

  final num userId;
  final num id;
  final String title;
  final String body;

  PlaceholderApiModelEx1 copyWith({
    num? userId,
    num? id,
    String? title,
    String? body,
  }) {
    return PlaceholderApiModelEx1(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
