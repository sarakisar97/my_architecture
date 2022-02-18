import 'package:my_architecture/domain/entities/post.dart';

class PostModel extends Post{
  const PostModel({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) : super(
      userId: userId,
      id: id,
      title: title,
      body: body,
  );

  factory PostModel.fromJson(dynamic json) {
    return PostModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
    );
  }
}