import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

import 'package:svarog/constants.dart';

Future<Tuple2<bool, Set<Uri>>> getInitialSettings() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  var listSources = prefs.getStringList("sources") ?? kDefaultSources;

  var isAppBarBottom = prefs.getBool("isAppBarBottom") ?? kIsAppBarBottom;
  Set<Uri> sources = Set.from(listSources.map((e) => Uri.parse(e)));

  return Tuple2(isAppBarBottom, sources);
}
