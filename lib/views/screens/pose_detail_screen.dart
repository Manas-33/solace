import 'package:flutter/material.dart';

import '../../apiService/yogaApiService.dart';

class PoseDetailScreen extends StatelessWidget {
  final Map<String, dynamic> pose;

  PoseDetailScreen({required this.pose});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pose['english_name'])),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
       Text(
  'Sanskrit Name: ${pose['sanskrit_name']}',
  style: TextStyle(
    color: Color.fromARGB(255, 224, 84, 15), 
  ),
),
            
            SizedBox(height: 20.0),
            Text('Description: ${pose['pose_description']}',style:TextStyle(color: Color.fromARGB(225, 5, 232, 240)),),
            SizedBox(height: 20.0),
            Text('Benefits: ${pose['pose_benefits']}'),
            SizedBox(height: 16.0),
            Image.network(pose['url_png']),
          ],
        ),
      ),
    );
  }
}
