String getTextFromJson(Map<String, dynamic> json) {
  String res = "";

  for (var val in json.values) {
    if (val is String) {
      res += val + "\n";
    }
  }

  return res;
}