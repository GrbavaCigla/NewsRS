Uri? getImageUrlFromJson(dynamic json) {
  if (json is List) {
    for(var item in json) {
      var itemImage = getImageUrlFromJson(item);
      if (itemImage != null) {
        return itemImage;
      }
    }
  } else if (json is Map) {
    for(var key in json.keys) {
      var itemImage = getImageUrlFromJson(json[key]);
      if (itemImage != null) {
        return itemImage;
      }
    }
  } else {
    if (json.toString().endsWith(".png") || json.toString().endsWith(".jpg")) {
      return Uri.parse(json.toString());
    }
  }
}
