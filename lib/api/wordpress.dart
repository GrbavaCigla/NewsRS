import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';

import 'package:svarog/constants.dart';
import 'package:svarog/api/exception.dart';
import 'package:svarog/models/article.dart';

// TODO: Cache everything

Future<String?> getUser(String website, int? id) async {
  if (id == null) {
    return Future.value(null);
  }

  var url = Uri.parse(website + '/wp-json/wp/v2/users/$id');
  var response = await http.get(url);

  if (response.statusCode != 200) {
    return Future.error(StatusCodeNot200());
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
    return Future.error(StatusCodeNot200());
  }

  return Future.value(jsonDecode(response.body)['name']);
}

Future<List<Article>> getPosts(
  String website, {
  int page = 1,
  int pageSize = kDefaultPageSize,
}) async {
  var url = Uri.parse(website + '/wp-json/wp/v2/posts?page=$page');

  http.Response? response;
  try {
    response = await http.get(url);
  } catch (exception) {
    return Future.error(exception);
  }

  if (response.statusCode != 200) {
    return Future.error(StatusCodeNot200());
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
      try {
        authors[article.author] =
            await getUser(website, int.tryParse(article.author!));
      } catch (err) {
        authors[article.author] = null;
      }
    }
    article.author = authors[article.author];

    var articleTags = List.from(article.categories);
    article.categories.clear();

    for (var tag in articleTags) {
      if (!tags.containsKey(tag)) {
        try {
          tags[tag] = await getTag(website, int.tryParse(tag));
        } catch (err) {
          tags[tag] = null;
        }
      }
      if (tags[tag] != null) {
        article.categories.add(tags[tag]!);
      }
    }

    articles.add(article);
  }

  return Future.value(articles);
}

Future<Tuple2<List<Article>, List<dynamic>>> getPostsFromSources(
  List<Uri> sources, {
  int page = 1,
  int pageSize = kDefaultPageSize,
}) async {
  var errors = [];

  var requests = await Future.wait(
    sources.map(
      (e) => getPosts(e.toString(), page: page).catchError(
        (err) {
          errors.add(err);
          return <Article>[];
        },
      ),
    ),
  );
  var flat = requests.expand((i) => i).toList();
  flat.sort((a, b) => b.date!.compareTo(a.date!));
  if (sources.length == errors.length) {
    return Future.error(errors);
  }

  return Future.value(Tuple2(flat, errors));
}
