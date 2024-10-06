class PostApiModel1 {
  PostApiModel1({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt,
  });

  factory PostApiModel1.fromJson(Map<String, dynamic> json) {
    return PostApiModel1(
      name: json['name'],
      job: json['job'],
      id: json['id'].toString(), // Ensure id is treated as String
      createdAt: json['createdAt'],
    );
  }

  final String name;
  final String job;
  final String id;
  final String createdAt;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'job': job,
      'id': id,
      'createdAt': createdAt,
    };
  }
}
