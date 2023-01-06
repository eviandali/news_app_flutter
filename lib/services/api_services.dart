import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app_2010020017/model/article_model.dart';

class ApiService {
  final endPointUrl = "newsapi.org";
  final client = http.Client();

  Future<List<Article>> getArticle() async {
    final queryParameters = {
      'country': 'id',
      'catergory': 'technology',
      'apiKey': '66666e29b9ae467c9de8b0ecd712e646'
    };

    final uri = Uri.https(endPointUrl, '/v2/top-headline', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}
