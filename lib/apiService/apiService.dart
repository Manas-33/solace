import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:solace/Models/quote.dart';
import 'dart:convert';

class ApiService {
  static Future<List<Quote>> fetchQuotes() async {
    final response = await http.get(Uri.parse('https://type.fit/api/quotes'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      final quotes = jsonData.map((json) => Quote.fromJson(json)).toList();
      return quotes;
    } else {
      throw Exception('Failed to load quotes');
    }
  }
}
