import 'package:flutter/material.dart';
import 'consts.dart';

Future<bool> exitDialog(BuildContext context) async {
  return await showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Exit?'),
          content: Text('Your local cards will become offline.\n' +
              'Are you sure you want to exit?'),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text("No"),
            ),
            // SizedBox(height: 32),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text("Yes"),
            ),
          ],
        ),
      ) ??
      false;
}

class Frame extends StatelessWidget {
  final Widget _title;
  final Widget _body;
  final Function() _backAction;
  final Widget _floatingActionButton;
  final List<Widget> _actions;

  Frame(
      {Widget title,
      Widget body,
      Function() backAction,
      Widget floatingActionButton,
      List<Widget> actions})
      : _title = title,
        _body = body,
        _backAction = backAction,
        _floatingActionButton = floatingActionButton,
        _actions = actions;

  @override
  Widget build(BuildContext context) {
    Widget leading;
    Future<bool> Function() onWillPop = () async => await exitDialog(context);

    if (_backAction != null) {
      leading = BackButton(onPressed: () => _backAction());
      onWillPop = () async {
        _backAction();
        return false;
      };
    }

    return MaterialApp(
        title: APP_TITLE,
        home: WillPopScope(
            onWillPop: onWillPop,
            child: Scaffold(
              appBar: AppBar(
                title: _title,
                leading: leading,
                actions: _actions,
              ),
              body: _body,
              floatingActionButton: _floatingActionButton,
            )));
  }
}

Widget frame(
    {@required Widget title,
    @required Widget body,
    Function() backAction,
    Widget floatingActionButton,
    List<Widget> actions}) {
  return Frame(
      title: title,
      body: body,
      backAction: backAction,
      floatingActionButton: floatingActionButton,
      actions: actions);
}
