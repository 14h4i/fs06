import 'category.dart';
import 'post_image.dart';

class Post {
  String? id;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? title;
  String? description;
  int? commentCounts;
  List<PostImage>? images;
  int? likeCount;
  int? viewCount;
  int? pulseScore;
  bool? isSensitive;
  bool? isPrivate;
  List<String>? tags;
  Category? category;
  String firstName = '';
  String lastName = '';
  String fullName = '';
  String? avatar;

  Post.formJson(Map<String, dynamic> json) {
    id = json["id"];
    status = json["status"];
    createdAt = DateTime.tryParse(json['created_at']);
    updatedAt = DateTime.tryParse(json['updated_at']);
    title = json["title"];
    description = json["description"];
    commentCounts = json["commentCounts"];
    likeCount = json["likeCount"];
    viewCount = json["viewCount"];
    pulseScore = json["pulseScore"];
    isSensitive = json["isSensitive"];
    isPrivate = json["isPrivate"];
    // List<String> tempList= List<String>.from(json["tags"]);
    tags = json["tags"] != null ? List<String>.from(json["tags"]) : null;
    images = tryParsePostImage(json['images']);
    category =
        json["category"] != null ? Category.formJson(json['category']) : null;
    if (json['user'] != null) {
      final user = json['user'];
      firstName = user['first_name'] ?? '';
      lastName = user['last_name'] ?? '';
      fullName = firstName + ' ' + lastName;
      if (user['avatar'] != null) {
        avatar = user['avatar']['url'];
      }
    }
  }

  static List<PostImage> tryParsePostImage(dynamic json) {
    List<dynamic> datalist = json as List<dynamic>;
    List<PostImage> newlist =
        datalist.map((e) => PostImage.fromJson(e)).toList();
    return newlist;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
      };
}
