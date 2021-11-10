Uri? getImageUrlFromJson(dynamic json) {
  if (json is List) {
    for (var item in json) {
      var itemImage = getImageUrlFromJson(item);
      if (itemImage != null) {
        return itemImage;
      }
    }
  } else if (json is Map) {
    for (var key in json.keys) {
      var itemImage = getImageUrlFromJson(json[key]);
      if (itemImage != null) {
        return itemImage;
      }
    }
  } else {
    var pieces = json.toString().split(".");

    if (['jpeg', 'png', 'gif', 'jpg'].contains(
      pieces[pieces.length - 1],
    )) {
      return Uri.tryParse(json.toString());
    }
  }
}
