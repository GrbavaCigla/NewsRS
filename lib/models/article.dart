import 'package:html_unescape/html_unescape_small.dart';

import 'package:newsrs/utils/image_search.dart';

class Article {
  String? title;
  String? author;
  DateTime? date;
  String? source;
  String? text;
  Uri? imageUrl;
  Uri? url;

  Article({
    this.title,
    this.author,
    this.date,
    this.source,
    this.text,
    this.imageUrl,
    this.url,
  });

  // TODO: Add author
  Article.fromJson(Map<String, dynamic> json)
      : title = HtmlUnescape().convert(json['title']['rendered']),
        date = DateTime.parse(json['date']),
        url = Uri.parse(json['link']),
        imageUrl = getImageUrlFromJson(json),
        text = json['content']['rendered'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'author': author,
        'date': date,
        'source': source,
        'text': text,
        'url': url,
        'imageUrl': imageUrl,
      };
}
