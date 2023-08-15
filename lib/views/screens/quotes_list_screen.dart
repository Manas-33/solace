import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:solace/Models/quote.dart';
import 'package:solace/apiService/apiService.dart';




class QuoteListScreen extends StatefulWidget {
  @override
  _QuoteListScreenState createState() => _QuoteListScreenState();
}

class _QuoteListScreenState extends State<QuoteListScreen> {
  late Future<List<Quote>> quotesFuture;

  @override
  void initState() {
    super.initState();
    quotesFuture = ApiService.fetchQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quote Viewer'),
      ),
      body: FutureBuilder<List<Quote>>(
        future: quotesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final quotes = snapshot.data!;
            final limitedQuotes =
                quotes.take(20).toList(); // Display the first ten quotes

            return ListView.builder(
              itemCount: limitedQuotes.length,
              itemBuilder: (context, index) {

               return Container(
                height: 150,
                
                  margin: EdgeInsets.symmetric(horizontal: 35, vertical: 8),
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            limitedQuotes[index].text,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '- ${limitedQuotes[index].author}',
                            style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );


                
              },
            );
          } else {
            return Center(child: Text('No quotes available.'));
          }
        },
      ),
    );
}
}
