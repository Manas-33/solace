
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solace/views/screens/webview_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Recommendation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommendation Page'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Recommended Quotes'),
            FutureBuilder<List<String>>(
              future:
                  fetchRecommendedQuotesFromFirebase(), 
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final recommendedItems = snapshot.data!;
                  return Column(
                    children: recommendedItems
                        .map((item) => _buildRecommendedItem(item))
                        .toList(),
                  );
                }
              },
            ),
            SizedBox(height: 20),
            _buildSectionTitle('Recommended Articles'),
            FutureBuilder<List<Map<String, String>>>(
              future: fetchRecommendedArticlesFromFirebase(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final recommendedArticles = snapshot.data!;
                  return Column(
                    children: recommendedArticles
                        .map((articleData) =>
                            _buildRecommendedArticle(context, articleData))
                        .toList(),
                  );
                } else {
                  return Text('No data available.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildRecommendedItem(String itemName) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.lightBlueAccent,
      child: ListTile(
        leading: Icon(Icons.star, color: Colors.yellow),
        title: Text(
          itemName,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

 Widget _buildRecommendedArticle(BuildContext context,Map<String, String?> articleData) {
    String? articleLink = articleData['article'];
    String? imageLink = articleData['image'];

    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.greenAccent,
      child: InkWell(
        onTap: () {
          if (articleLink != null) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => WebViewPage(articleLink),
            ));
          }
        },
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (imageLink != null)
                Container(
                  height: 80,
                  width: 80, 
                  child: Image.network(
                    imageLink,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              SizedBox(width: 16),
              Expanded(
                child: ListTile(
                  title: Text(
                    articleLink ?? 'No article link available',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }




  Future<List<String>> fetchRecommendedQuotesFromFirebase() async {
    try {

      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection('happy')
          .doc('quotes')
          .get();

      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;

    
      List<String> recommendedQuotes = [];

      for (int i = 1; i <= 5; i++) {
        if (data.containsKey('quote$i')) {
          recommendedQuotes.add(data['quote$i']);
        }
      }

      return recommendedQuotes;
    } catch (error) {
     
      print("Error fetching data from Firebase: $error");
      return [];
    }
  }

  Future<List<Map<String, String>>>
      fetchRecommendedArticlesFromFirebase() async {
    try {
     
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection('happy')
          .doc('articles')
          .get();

    
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;

      List<Map<String, String>> recommendedArticles = [];

      for (int i = 1; i <= 3; i++) {
        String articleKey = 'link$i';
        String imageKey = 'image$i';

        if (data.containsKey(articleKey) && data.containsKey(imageKey)) {
          Map<String, String> articleData = {
            'article': data[articleKey],
            'image': data[imageKey],
          };
          recommendedArticles.add(articleData);
        }
      }

      return recommendedArticles;
    } catch (error) {
      
      print("Error fetching data from Firebase: $error");
      return [];
    }
  }
}
