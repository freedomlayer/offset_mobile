import 'package:flutter/material.dart';
import 'consts.dart';

Widget frame({@required Widget title, @required Widget body}) {
  return MaterialApp(
    title: APP_TITLE,
    home: Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: body,
    ),
  );
}
