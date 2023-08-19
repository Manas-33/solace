import 'package:flutter/material.dart';
import 'package:solace/views/screens/pose_detail_screen.dart';
import '../../apiService/yogaApiService.dart';

class PosesScreen extends StatelessWidget {
  final String categoryId;
  final YogaApiService apiService = YogaApiService();

  PosesScreen({required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Yoga Poses')),
      body: FutureBuilder<List<dynamic>>(
        future: apiService.getPosesByCategory(categoryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No poses available for this category'));
          } else {
            List<dynamic> poses = snapshot.data!;
            return ListView.builder(
              itemCount: poses.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> pose = poses[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PoseDetailScreen(pose: pose),
                      ),
                    );
                    print("Selected pose: ${pose['english_name']}");
                  },
                  child: Card(
                    elevation: 4.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 100.0,
                          height: 100.0,
                          child:
                              Image.network(pose['url_png'], fit: BoxFit.cover),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Text(
                            pose['english_name'],
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
