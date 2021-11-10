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

  Article.fromJson(Map<String, dynamic> json)
      : title = json['title']['rendered'],
        date = DateTime.parse(json['date']),
        url = Uri.parse(json['link']),
        imageUrl = getImageUrlFromJson(json),
        text = json['content']['rendered'];

    
    // TODO: Add author
  Article.fromYoastJson(Map<String, dynamic> json) : 
        title = json['yoast_head_json']['title'],
        date = DateTime.parse(json['date']),
        text = json['content']['rendered'],
        imageUrl = getImageUrlFromJson(json),
        url = Uri.parse(json['link']);

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
