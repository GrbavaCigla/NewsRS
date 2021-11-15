import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';

import 'package:newsrs/api/exception.dart';
import 'package:newsrs/models/article.dart';

// TODO: Cache everything

Future<String?> getUser(String website, int? id) async {
  if (id == null) {
    return Future.value(null);
  }

  var url = Uri.parse(website + '/wp-json/wp/v2/users/$id');
  var response = await http.get(url);

  if (response.statusCode != 200) {
    return Future.error(StatusCodeNode200());
  }

  return Future.value(jsonDecode(response.body)['name']);
}

Future<String?> getTag(String website, int? id) async {
  if (id == null) {
    return Future.value(null);
  }

  var url = Uri.parse(website + '/wp-json/wp/v2/categories/$id');
  var response = await http.get(url);

  if (response.statusCode != 200) {
    return Future.error(StatusCodeNode200());
  }

  return Future.value(jsonDecode(response.body)['name']);
}

Future<List<Article>> getPosts(String website) async {
  var url = Uri.parse(website + '/wp-json/wp/v2/posts');

  http.Response? response;
  try {
    response = await http.get(url);
  } catch (exception) {
    return Future.error(exception);
  }

  if (response.statusCode != 200) {
    return Future.error(StatusCodeNode200());
  }

  var json = jsonDecode(response.body);

  List<Article> articles = [];
  Map<String?, String?> authors = {};
  Map<String?, String?> tags = {};

  for (var jsonArticle in json) {
    Article article;
    article = Article.fromJson(jsonArticle);
    article.source = url.host;

    if (!authors.containsKey(article.author)) {
      authors[article.author] =
          await getUser(website, int.tryParse(article.author!));
    }
    article.author = authors[article.author];

    var articleTags = List.from(article.categories);
    article.categories.clear();

    for (var tag in articleTags) {
      if (!tags.containsKey(tag)) {
        tags[tag] = await getTag(website, int.tryParse(tag));
      }

      article.categories.add(tags[tag]!);
    }

    articles.add(article);
  }

  return Future.value(articles);
}

Future<Tuple2<List<Article>, List<dynamic>>> getPostsFromSources(List<Uri> sources) async {
  var errors = [];

  var requests = await Future.wait(
    sources.map(
      (e) => getPosts(e.toString()).catchError(
        (err) {
          errors.add(err);
          return <Article>[];
        },
      ),
    ),
  );
  var flat = requests.expand((i) => i).toList();
  flat.sort((a, b) => b.date!.compareTo(a.date!));
  if(sources.length == errors.length) {
    return Future.error(errors);
  }

  return Future.value(Tuple2(flat, errors));
}
