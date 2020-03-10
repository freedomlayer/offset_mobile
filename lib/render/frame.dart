import 'package:flutter/material.dart';
import 'consts.dart';

Future<bool> exitDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text('Are you sure?'),
      content: Text('Do you want to exit?'),
      actions: <Widget>[
        GestureDetector(
          onTap: () => Navigator.of(context).pop(false),
          child: Text("No"),
        ),
        SizedBox(height: 32),
        GestureDetector(
          onTap: () => Navigator.of(context).pop(true),
          child: Text("Yes"),
        ),
      ],
    ),
  ) ?? false;
}

class InnerFrame extends StatelessWidget {
  final Widget _title;
  final Widget _body;
  final Function() _backAction;
  final Widget _floatingActionButton;

  InnerFrame(
      {Widget title,
      Widget body,
      Function() backAction,
      Widget floatingActionButton})
      : _title = title,
        _body = body,
        _backAction = backAction,
        _floatingActionButton = floatingActionButton;

  @override
  Widget build(BuildContext context) {
    Widget leading;
    Future<bool> Function() onWillPop = () async  => await exitDialog(context);

    if (_backAction != null) {
      leading = BackButton(onPressed: () => _backAction());
      onWillPop = () async {
        _backAction();
        return false;
      };
    }

    return WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          appBar: AppBar(
            title: _title,
            leading: leading,
          ),
          body: _body,
          floatingActionButton: _floatingActionButton,
        ));
  }
}

Widget frame(
    {@required Widget title,
    @required Widget body,
    Function() backAction,
    Widget floatingActionButton}) {
  return MaterialApp(
      title: APP_TITLE,
      home: InnerFrame(
          title: title,
          body: body,
          backAction: backAction,
          floatingActionButton: floatingActionButton));
}
