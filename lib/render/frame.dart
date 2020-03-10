import 'package:flutter/material.dart';
import 'consts.dart';

Widget frame(
    {@required Widget title, @required Widget body, Function() backAction}) {
  Widget appTitle;
  if (backAction != null) {
    // We provide a back arrow to the title bar:
    appTitle = Row(
        children: [BackButton(onPressed: () => backAction()), title]);
  } else {
    // No back arrow:
    appTitle = title;
  }

  return MaterialApp(
    title: APP_TITLE,
    home: Scaffold(
      appBar: AppBar(
        title: appTitle,
      ),
      body: body,
    ),
  );
}
