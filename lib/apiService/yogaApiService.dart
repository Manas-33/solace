import 'dart:convert';
import 'package:http/http.dart' as http;

class YogaApiService {
  final String baseUrl = "https://yoga-api-nzy4.onrender.com/v1";

  Future<List<dynamic>> getCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<dynamic>> getPosesByCategory(String categoryId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/categories?id=$categoryId'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final List<dynamic> poses = responseData['poses'];
      return poses;
    } else {
      throw Exception('Failed to load poses');
    }
  }

}
