import 'package:html_unescape/html_unescape_small.dart';

import 'package:newsrs/utils/image_search.dart';
import 'package:newsrs/utils/text_search.dart';

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

  factory Article.fromJson(Map<String, dynamic> json) {
    // Check if ACF plugin is used because if it is, text will be empty
    String text = json['content']['rendered'];
    if (text.isEmpty && json.containsKey('acf')) {
      // TODO: This isn't the best solution, should become better with more acf examples
      text = getTextFromJson(json['acf']);
    }

    return Article(
      title: HtmlUnescape().convert(json['title']['rendered']),
      author: json['author'].toString(),
      date: DateTime.parse(json['date']),
      url: Uri.parse(json['link']),
      imageUrl: getImageUrlFromJson(json),
      categories: json['categories'].map<String>((e) => e.toString()).toList(),
      text: text,
    );
  }
}
