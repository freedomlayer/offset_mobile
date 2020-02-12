import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

part 'settings.g.dart';

@BuiltUnion()
class SettingsView extends _$SettingsView {
  static Serializer<SettingsView> get serializer => _$settingsViewSerializer;

  // TODO: Fill in here:
  SettingsView.variant(int myInt) : super.variant(myInt);
}

