import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:svarog/constants.dart';
import 'package:tuple/tuple.dart';

class DynamicSettings extends StatefulWidget {
  final Widget child;
  final Tuple2<bool, Set<Uri>> initial;

  const DynamicSettings({
    Key? key,
    required this.child,
    required this.initial,
  }) : super(key: key);

  static _DynamicSettingsState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SettingsData>()!.state;

  @override
  _DynamicSettingsState createState() => _DynamicSettingsState();
}

class _DynamicSettingsState extends State<DynamicSettings> {
  late bool _isAppBarBottom = widget.initial.item1;
  late Set<Uri> _sources = widget.initial.item2;

  bool get isAppBarBottom => _isAppBarBottom;
  Set<Uri> get sources => _sources;

  set isAppBarBottom(bool newValue) {
    setState(
      () => _isAppBarBottom = newValue,
    );

    SharedPreferences.getInstance().then(
      (value) => value.setBool("isAppBarBottom", newValue),
    );
  }

  // TODO: Remove source from settings
  set sources(Set<Uri> newValue) {
    setState(
      () => _sources = newValue,
    );

    SharedPreferences.getInstance().then(
      (value) => value.setStringList(
        "sources",
        newValue.map((e) => e.toString()).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SettingsData(
      child: widget.child,
      state: this,
      isAppBarBottom: _isAppBarBottom,
      sources: _sources,
    );
  }
}

class SettingsData extends InheritedWidget {
  final bool isAppBarBottom;
  final _DynamicSettingsState state;
  final Set<Uri> sources;

  const SettingsData({
    Key? key,
    required Widget child,
    required this.isAppBarBottom,
    required this.sources,
    required this.state,
  }) : super(key: key, child: child);

  static SettingsData? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SettingsData>();

  @override
  bool updateShouldNotify(SettingsData oldWidget) =>
      isAppBarBottom != oldWidget.isAppBarBottom ||
      sources != oldWidget.sources;
}
