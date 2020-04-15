import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../actions/actions.dart';
import 'consts.dart';
import 'frame.dart';

Widget renderAbout(Function(AboutAction) queueAction) {
  final body = Center(child: Text('About'));
  return frame(
      title: Text(APP_TITLE),
      body: body,
      backAction: () => queueAction(AboutAction.back()));
}
