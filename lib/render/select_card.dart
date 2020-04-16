import 'package:flutter/material.dart';

import '../protocol/protocol.dart';

/// A generic select card dialog
Widget renderSelectCard(Iterable<NodeName> nodeNames,
    Iterable<NodeName> enabledNodes, Function(NodeName) selectCardAction) {
  final enabledNodesSet = enabledNodes.toSet();
  final children = (nodeNames.toList()..sort()).map((nodeName) {
    final enabled = enabledNodesSet.contains(nodeName);
    return ListTile(
      key: Key(nodeName.inner),
      title: Text('${nodeName.inner}'),
      leading: Icon(Icons.credit_card),
      enabled: enabled,
      onTap: enabled ? () => selectCardAction(nodeName) : null,
    );
  }).toList();

  final listView = children.isNotEmpty
      ? ListView(children: children, padding: EdgeInsets.all(8))
      : Center(child: Text('No cards configured'));

  final pleaseSelect = children.isNotEmpty
      ? <Widget>[
          Text(
            'Please select a card',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          )
        ]
      : <Widget>[];

  return Padding(
      padding: EdgeInsets.only(top: 14.0),
      child: Column(
          children: pleaseSelect +
              [
                Expanded(child: listView),
              ]));
}
