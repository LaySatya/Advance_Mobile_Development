class PostDto {
  final int id;
  final String title;
  final String body;

  PostDto({required this.id, required this.title, required this.body});

  // Convert JSON to PostDto
  factory PostDto.fromJson(Map<String, dynamic> json) {
    assert(json['id'] is int);
    assert(json['title'] is String);
    assert(json['body'] is String);

    return PostDto(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}