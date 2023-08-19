class YogaPose {
  final int id;
  final String englishName;
  final String sanskritName;
  final String poseDescription;
  final String poseBenefits;
  final String urlSvg;
  final String urlPng;

  YogaPose({
    required this.id,
    required this.englishName,
    required this.sanskritName,
    required this.poseDescription,
    required this.poseBenefits,
    required this.urlSvg,
    required this.urlPng,
  });

  factory YogaPose.fromJson(Map<String, dynamic> json) {
    return YogaPose(
      id: json['id'],
      englishName: json['english_name'],
      sanskritName: json['sanskrit_name'],
      poseDescription: json['pose_description'],
      poseBenefits: json['pose_benefits'],
      urlSvg: json['url_svg'],
      urlPng: json['url_png'],
    );
  }
}
