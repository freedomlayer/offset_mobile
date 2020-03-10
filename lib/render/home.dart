import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

import '../protocol/protocol.dart';
import '../state/state.dart';
import '../actions/actions.dart';
import 'consts.dart';

Widget renderHome(BuiltMap<NodeName, NodeState> nodesStates, Function(HomeAction) queueAction) {

  return MaterialApp(
    title: APP_TITLE,
    home: Scaffold(
      appBar: AppBar(
        title: Text(APP_TITLE),
      ),
      body: Text('This is the body!'),
    ),
  );
}

/*
  return MaterialApp(
    title: APP_TITLE,
    home: Scaffold(
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
              child: Container(
                  child: BackButton(), alignment: Alignment.centerLeft),
              flex: 1),
          Expanded(child: Center(child: Text(APP_TITLE)), flex: 3),
          Spacer(flex: 1),
        ]),
      ),
    ),
  );
*/
