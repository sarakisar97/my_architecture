import 'package:my_architecture/domain/entities/post.dart';

class PostModel extends Post{
  PostModel({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) : super(
      userId: userId,
      id: id,
      title: title,
      body: body,
  );

  PostModel.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}