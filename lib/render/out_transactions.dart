import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../protocol/protocol.dart';
import '../protocol/file.dart';
import '../state/state.dart';
import '../actions/actions.dart';

import 'utils/share_file.dart';
import 'utils/qr_show.dart';
import 'utils/amount.dart';

import 'frame.dart';

Widget renderOutTransactions(
    OutTransactionsView outTransactionsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(OutTransactionsAction) queueAction) {
  return outTransactionsView.match(
      home: () => _renderHome(nodesStates, queueAction),
      transaction: (nodeName, paymentId) =>
          _renderTransaction(nodeName, paymentId, nodesStates, queueAction));
}

/// A single outgoing transaction's information
class OutTransaction {
  final NodeName nodeName;
  Currency currency;
  final PaymentId paymentId;
  U128 destPayment;
  final String description;
  Generation generation;
  OpenPaymentStatus status;

  OutTransaction(
      {this.nodeName,
      this.currency,
      this.paymentId,
      this.destPayment,
      this.description,
      this.generation,
      this.status});
}

/*
String _statusAsString(OpenPaymentStatus openPaymentStatus) {
  return openPaymentStatus.match(
      searchingRoute: (_) => 'searching route',
      foundRoute: (_a, _b) => 'found route',
      sending: (_) => 'sending',
      commit: (_a, _b) => 'commit',
      success: (_a, _b, _c) => 'success',
      failure: (_) => 'failure');
}
*/

List<OutTransaction> _loadTransactions(
    BuiltMap<NodeName, NodeState> nodesStates) {
  final outTransactions = <OutTransaction>[];

  nodesStates.forEach((nodeName, nodeState) {
    final nodeOpen =
        nodeState.inner.match(closed: () => null, open: (nodeOpen) => nodeOpen);

    if (nodeOpen == null) {
      return; // continue
    }

    final openPayments = nodeOpen.compactReport.openPayments;
    openPayments.forEach((paymentId, openPayment) {
      final outTransaction = OutTransaction(
          nodeName: nodeName,
          currency: openPayment.currency,
          paymentId: paymentId,
          destPayment: openPayment.destPayment,
          description: openPayment.description,
          generation: openPayment.generation,
          status: openPayment.status);
      outTransactions.add(outTransaction);
    });
  });

  outTransactions.sort((a, b) {
    final cmpList = [
      // Sort chronologically
      a.generation.compareTo(b.generation),
      // Use PaymentId as tie breaker:
      a.paymentId.compareTo(b.paymentId)
    ];
    for (final val in cmpList) {
      if (val != 0) {
        return val;
      }
    }
    return 0;
  });

  return outTransactions.reversed.toList();
}

Widget _renderHome(BuiltMap<NodeName, NodeState> nodesStates,
    Function(OutTransactionsAction) queueAction) {
  final outTransactions = _loadTransactions(nodesStates);

  final children = <Widget>[];

  for (final outTransaction in outTransactions) {
    IconData trailingIcon;
    Color statusColor;
    outTransaction.status.match(searchingRoute: (_) {
      trailingIcon = FontAwesomeIcons.search;
      statusColor = Colors.orange;
    }, foundRoute: (_a, _b) {
      trailingIcon = FontAwesomeIcons.route;
      statusColor = Colors.orange;
    }, sending: (_) {
      trailingIcon = FontAwesomeIcons.paperPlane;
      statusColor = Colors.orange;
    }, commit: (_a, _b) {
      trailingIcon = FontAwesomeIcons.stamp;
      statusColor = Colors.orange;
    }, success: (_a, _b, _c) {
      trailingIcon = FontAwesomeIcons.checkCircle;
      statusColor = Colors.green;
    }, failure: (_) {
      trailingIcon = FontAwesomeIcons.exclamationTriangle;
      statusColor = Colors.red;
    });

    assert(trailingIcon != null);
    assert(statusColor != null);

    final trailing = FaIcon(trailingIcon, color: statusColor);
    final outEntry = ListTile(
        key: Key(outTransaction.paymentId.inner),
        leading: Icon(Icons.call_made),
        title: InkWell(
          onTap: () => queueAction(OutTransactionsAction.selectPayment(
              outTransaction.nodeName, outTransaction.paymentId)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('${outTransaction.nodeName.inner}'),
            Text(
                '${amountToString(outTransaction.destPayment)} ${outTransaction.currency.inner}',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('${outTransaction.description}'),
            /*
            Text('${_statusAsString(outTransaction.status)}',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: statusColor)),
            */
          ]),
        ),
        trailing: trailing);
    children.add(outEntry);
  }

  final listView = children.isNotEmpty
      ? ListView.separated(
          padding: EdgeInsets.all(8),
          itemCount: children.length,
          separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
              ),
          itemBuilder: (context, index) => children[index])
      : Center(child: Text('No outgoing transactions'));

  return frame(
      title: Text('Outgoing'),
      body: listView,
      backAction: () => queueAction(OutTransactionsAction.back()));
}

Widget _renderTransaction(
    NodeName nodeName,
    PaymentId paymentId,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(OutTransactionsAction) queueAction) {
  final nodeState = nodesStates[nodeName];
  assert(nodeState != null);

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);
  assert(nodeOpen != null);

  final openPayment = nodeOpen.compactReport.openPayments[paymentId];
  assert(openPayment != null);

  /*
  // DEBUG:
  final receipt = Receipt((b) => b
      ..responseHash = HashResult('HashResult')
      ..srcPlainLock = PlainLock('PlainLock')
      ..destPlainLock = PlainLock('PlainLock')
      ..destPayment = U128(BigInt.from(100))
      ..totalDestPayment = U128(BigInt.from(100))
      ..invoiceId = InvoiceId('InvoiceId')
      ..currency = Currency('Currency')
      ..signature = Signature('Signature')
      ..isComplete = true);

  return _renderFailure(NodeName('NodeName'),
      PaymentId('PaymentId'), openPayment, (_) => {});
  */

  // return _renderSuccess(receipt, U128(BigInt.from(13)), NodeName('NodeName'),
  // PaymentId('PaymentId'), openPayment, (_) => {});
  /*
  final commit = Commit((b) => b
      ..responseHash = HashResult('HashResult')
      ..srcPlainLock = PlainLock('PlainLock')
      ..destHashedLock = HashedLock('HashedLock')
      ..destPayment = U128(BigInt.from(100))
      ..totalDestPayment = U128(BigInt.from(100))
      ..invoiceId = InvoiceId('InvoiceId')
      ..currency = Currency('Currency')
      ..signature = Signature('Signature'));
  return _renderCommit(commit, U128(BigInt.from(13)), NodeName('NodeName'),
      PaymentId('PaymentId'), openPayment, (_) => {});
  */

  // return _renderSending(U128(BigInt.from(13)), NodeName('NodeName'),
  // PaymentId('PaymentId'), openPayment, (_) => {});

  // return _renderFoundRoute(U128(BigInt.from(13)), NodeName('NodeName'),
  // PaymentId('PaymentId'), openPayment, (_) => {});

  // DEBUG:
  // return _renderSearchingRoute(
  //    NodeName('NodeName'), PaymentId('PaymentId'), openPayment, (_) => {});

  return openPayment.status.match(
      searchingRoute: (_) =>
          _renderSearchingRoute(nodeName, paymentId, openPayment, queueAction),
      foundRoute: (_, fees) => _renderFoundRoute(
          fees, nodeName, paymentId, openPayment, queueAction),
      sending: (fees) =>
          _renderSending(fees, nodeName, paymentId, openPayment, queueAction),
      commit: (commit, fees) => _renderCommit(
          commit, fees, nodeName, paymentId, openPayment, queueAction),
      success: (receipt, fees, _) => _renderSuccess(
          receipt, fees, nodeName, paymentId, openPayment, queueAction),
      failure: (_) =>
          _renderFailure(nodeName, paymentId, openPayment, queueAction));
}

Widget _renderSearchingRoute(NodeName nodeName, PaymentId paymentId,
    OpenPayment openPayment, Function(OutTransactionsAction) queueAction) {
  final listView = ListView(padding: EdgeInsets.all(8), children: <Widget>[
    ListTile(
        leading: FaIcon(FontAwesomeIcons.creditCard),
        title: Text('${nodeName.inner}')),
    ListTile(
        leading: FaIcon(FontAwesomeIcons.coins),
        title: Text(
            '${amountToString(openPayment.destPayment)} ${openPayment.currency.inner}')),
    ListTile(
        leading: const FaIcon(FontAwesomeIcons.comment),
        title: Text('${openPayment.description}')),
    SizedBox(height: 20),
    Center(child: CircularProgressIndicator(value: null)),
    SizedBox(height: 30),
    FlatButton.icon(
        icon: Icon(Icons.cancel, color: Colors.red),
        onPressed: () => queueAction(
            OutTransactionsAction.cancelPayment(nodeName, paymentId)),
        label: Text('Cancel')),
  ]);

  final body = Builder(
      builder: (BuildContext context) => Column(children: [
            Container(
                color: Theme.of(context).accentColor,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: ListTile(
                        leading: FaIcon(FontAwesomeIcons.search),
                        title: Text('Searching route')))),
            Divider(height: 0, color: Colors.grey),
            Expanded(child: listView),
          ]));

  return frame(
      title: Text('Outgoing transaction'),
      body: body,
      backAction: () => queueAction(OutTransactionsAction.back()));
}

Widget _renderFoundRoute(U128 fees, NodeName nodeName, PaymentId paymentId,
    OpenPayment openPayment, Function(OutTransactionsAction) queueAction) {
  final listView = ListView(padding: EdgeInsets.all(8), children: <Widget>[
    ListTile(
        leading: FaIcon(FontAwesomeIcons.creditCard),
        title: Text('${nodeName.inner}')),
    ListTile(
        leading: FaIcon(FontAwesomeIcons.coins),
        title: Text(
            '${amountToString(openPayment.destPayment)} ${openPayment.currency.inner}')),
    ListTile(
        leading: const FaIcon(FontAwesomeIcons.comment),
        title: Text('${openPayment.description}')),
    ListTile(
        leading: const FaIcon(FontAwesomeIcons.funnelDollar),
        title: Text('${amountToString(fees)} ${openPayment.currency.inner}')),
    Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      RaisedButton.icon(
          icon: Icon(Icons.done, color: Colors.green),
          onPressed: () => queueAction(
              OutTransactionsAction.confirmFees(nodeName, paymentId)),
          label: Text('Confirm')),
      SizedBox(width: 20.0),
      FlatButton.icon(
          icon: Icon(Icons.cancel, color: Colors.red),
          onPressed: () => queueAction(
              OutTransactionsAction.cancelPayment(nodeName, paymentId)),
          label: Text('Cancel')),
    ]))
  ]);

  final body = Builder(
      builder: (BuildContext context) => Column(children: [
            Container(
                color: Theme.of(context).accentColor,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: ListTile(
                        leading: FaIcon(FontAwesomeIcons.route),
                        title: Text('Found route')))),
            Divider(height: 0, color: Colors.grey),
            Expanded(child: listView),
          ]));

  return frame(
      title: Text('Outgoing transaction'),
      body: body,
      backAction: () => queueAction(OutTransactionsAction.back()));
}

Widget _renderSending(U128 fees, NodeName nodeName, PaymentId paymentId,
    OpenPayment openPayment, Function(OutTransactionsAction) queueAction) {
  final listView = ListView(padding: EdgeInsets.all(8), children: <Widget>[
    ListTile(
        leading: FaIcon(FontAwesomeIcons.creditCard),
        title: Text('${nodeName.inner}')),
    ListTile(
        leading: FaIcon(FontAwesomeIcons.coins),
        title: Text(
            '${amountToString(openPayment.destPayment)} ${openPayment.currency.inner}')),
    ListTile(
        leading: const FaIcon(FontAwesomeIcons.comment),
        title: Text('${openPayment.description}')),
    ListTile(
        leading: const FaIcon(FontAwesomeIcons.funnelDollar),
        title: Text('${amountToString(fees)} ${openPayment.currency.inner}')),
    SizedBox(height: 20),
    Center(child: CircularProgressIndicator(value: null)),
    SizedBox(height: 30),
    Center(
        child: FlatButton.icon(
            icon: Icon(Icons.cancel, color: Colors.red),
            onPressed: () => queueAction(
                OutTransactionsAction.cancelPayment(nodeName, paymentId)),
            label: Text('Cancel'))),
  ]);

  final body = Builder(
      builder: (BuildContext context) => Column(children: [
            Container(
                color: Theme.of(context).accentColor,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: ListTile(
                        leading: FaIcon(FontAwesomeIcons.paperPlane),
                        title: Text('Sending')))),
            Divider(height: 0, color: Colors.grey),
            Expanded(child: listView),
          ]));

  return frame(
      title: Text('Outgoing transaction'),
      body: body,
      backAction: () => queueAction(OutTransactionsAction.back()));
}

Widget _renderCommit(
    Commit commit,
    U128 fees,
    NodeName nodeName,
    PaymentId paymentId,
    OpenPayment openPayment,
    Function(OutTransactionsAction) queueAction) {
  final listView = ListView(padding: EdgeInsets.all(8), children: <Widget>[
    ListTile(
        leading: FaIcon(FontAwesomeIcons.creditCard),
        title: Text('${nodeName.inner}')),
    ListTile(
        leading: FaIcon(FontAwesomeIcons.coins),
        title: Text(
            '${amountToString(openPayment.destPayment)} ${openPayment.currency.inner}')),
    ListTile(
        leading: const FaIcon(FontAwesomeIcons.comment),
        title: Text('${openPayment.description}')),
    ListTile(
        leading: const FaIcon(FontAwesomeIcons.funnelDollar),
        title: Text('${amountToString(fees)} ${openPayment.currency.inner}')),
    /*
    Center(
        child: Text('Commitment',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0))),
    */
    Center(child: qrShow<Commit>(commit)),
    SizedBox(height: 20),
    Center(
        child: RaisedButton.icon(
            // TODO: Create a better name for the commitment file:
            icon: const FaIcon(FontAwesomeIcons.shareAlt),
            onPressed: () async =>
                await shareFile<Commit>(commit, 'commit.$COMMIT_EXT'),
            label: Text('Send commitment'))),
  ]);

  final body = Builder(
      builder: (BuildContext context) => Column(children: [
            Container(
                color: Theme.of(context).accentColor,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: ListTile(
                        leading: FaIcon(FontAwesomeIcons.stamp),
                        title: Text('Commitment')))),
            Divider(height: 0, color: Colors.grey),
            Expanded(child: listView),
          ]));

  return frame(
      title: Text('Outgoing transaction'),
      body: body,
      backAction: () => queueAction(OutTransactionsAction.back()));
}

Widget _renderSuccess(
    Receipt receipt,
    U128 fees,
    NodeName nodeName,
    PaymentId paymentId,
    OpenPayment openPayment,
    Function(OutTransactionsAction) queueAction) {
  final listView = ListView(padding: EdgeInsets.all(8), children: <Widget>[
    ListTile(
        leading: FaIcon(FontAwesomeIcons.creditCard),
        title: Text('${nodeName.inner}')),
    ListTile(
        leading: FaIcon(FontAwesomeIcons.coins),
        title: Text(
            '${amountToString(openPayment.destPayment)} ${openPayment.currency.inner}')),
    ListTile(
        leading: const FaIcon(FontAwesomeIcons.comment),
        title: Text('${openPayment.description}')),
    ListTile(
        leading: const FaIcon(FontAwesomeIcons.funnelDollar),
        title: Text('${amountToString(fees)} ${openPayment.currency.inner}')),
    SizedBox(height: 30.0),
    Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      RaisedButton.icon(
          // TODO: Create a better name for the produced receipt file:
          icon: const FaIcon(FontAwesomeIcons.shareAlt),
          onPressed: () async =>
              await shareFile<Receipt>(receipt, 'receipt.receipt'),
          label: Text('Send Receipt')),
      SizedBox(width: 20.0),
      FlatButton.icon(
          icon: const FaIcon(FontAwesomeIcons.trashAlt),
          onPressed: () => queueAction(
              OutTransactionsAction.discardPayment(nodeName, paymentId)),
          label: Text('Discard')),
    ]))
  ]);

  final body = Builder(
      builder: (BuildContext context) => Column(children: [
            Container(
                color: Theme.of(context).accentColor,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: ListTile(
                        leading: FaIcon(FontAwesomeIcons.checkCircle,
                            color: Colors.green),
                        title: Text('Success')))),
            Divider(height: 0, color: Colors.grey),
            Expanded(child: listView),
          ]));

  return frame(
      title: Text('Outgoing transaction'),
      body: body,
      backAction: () => queueAction(OutTransactionsAction.back()));
}

Widget _renderFailure(NodeName nodeName, PaymentId paymentId,
    OpenPayment openPayment, Function(OutTransactionsAction) queueAction) {
  final listView = ListView(padding: EdgeInsets.all(8), children: <Widget>[
    ListTile(
        leading: FaIcon(FontAwesomeIcons.creditCard),
        title: Text('${nodeName.inner}')),
    ListTile(
        leading: FaIcon(FontAwesomeIcons.coins),
        title: Text(
            '${amountToString(openPayment.destPayment)} ${openPayment.currency.inner}')),
    ListTile(
        leading: const FaIcon(FontAwesomeIcons.comment),
        title: Text('${openPayment.description}')),
    SizedBox(width: 20.0),
    Align(
        child: RaisedButton.icon(
            icon: const FaIcon(FontAwesomeIcons.trashAlt),
            onPressed: () => queueAction(
                OutTransactionsAction.discardPayment(nodeName, paymentId)),
            label: Text('Discard'))),
  ]);

  final body = Builder(
      builder: (BuildContext context) => Column(children: [
            Container(
                color: Theme.of(context).accentColor,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: ListTile(
                        leading: FaIcon(FontAwesomeIcons.exclamationTriangle,
                            color: Colors.red),
                        title: Text('Failure')))),
            Divider(height: 0, color: Colors.grey),
            Expanded(child: listView),
          ]));

  return frame(
      title: Text('Outgoing transaction'),
      body: body,
      backAction: () => queueAction(OutTransactionsAction.back()));
}
