import 'yogaPose.dart';

class YogaCategory {
  final int id;
  final String name;
  final String description;
  final List<YogaPose> poses;

  YogaCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.poses,
  });

  factory YogaCategory.fromJson(Map<String, dynamic> json) {
    List<dynamic> poseJson = json['poses'];
    List<YogaPose> poses =
        poseJson.map((pose) => YogaPose.fromJson(pose)).toList();

    return YogaCategory(
      id: json['id'],
      name: json['category_name'],
      description: json['category_description'],
      poses: poses,
    );
  }
}
