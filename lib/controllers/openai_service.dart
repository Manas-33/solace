import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:solace/controllers/secrets.dart';

class OpenAIController {
  Future<String> getResponse(String prompt) async {
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIAPIKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              'role': 'user',
              'content': '$prompt. Answer very shortly in 5 words.',
            }
          ],
        }),
      );
      print("This is the res body: ${res.body}");
      if (res.statusCode == 200) {
        String content =
            jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim();
        print("This is the content returned: $content");
        return content;
      }
      return 'An internal error occurred';
    } catch (e) {
      return e.toString();
    }
  }
}
