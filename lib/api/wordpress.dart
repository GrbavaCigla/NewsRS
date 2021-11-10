import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:newsrs/models/article.dart';

Future<List<Article>> getPosts(String website) async {
  var url = Uri.parse(website + '/wp-json/wp/v2/posts');
  var response = await http.get(url);

  if (response.statusCode != 200) {
    // TODO: Make this better
    return Future.error("Status code not 200");
  }

  var json = jsonDecode(response.body);

  List<Article> articles = [];

  for (var jsonArticle in json) {
    Article article;
    article = Article.fromJson(jsonArticle);
    article.source = url.origin;

    articles.add(article);
  }

  return Future.value(articles);
}
