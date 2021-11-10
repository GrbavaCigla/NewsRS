import 'package:html_unescape/html_unescape_small.dart';

import 'package:newsrs/utils/image_search.dart';

class Article {
  String? title;
  String? author;
  DateTime? date;
  String? source;
  String? text;
  List<String> categories;
  Uri? imageUrl;
  Uri? url;

  Article({
    this.title,
    this.author,
    this.date,
    this.source,
    this.text,
    this.categories = const [],
    this.imageUrl,
    this.url,
  });

  // TODO: Add author
  Article.fromJson(Map<String, dynamic> json)
      : title = HtmlUnescape().convert(json['title']['rendered']),
        author = json['author'].toString(),
        date = DateTime.parse(json['date']),
        url = Uri.parse(json['link']),
        imageUrl = getImageUrlFromJson(json),
        categories = json['categories'].map<String>((e) => e.toString()).toList(),
        text = json['content']['rendered'];
}
