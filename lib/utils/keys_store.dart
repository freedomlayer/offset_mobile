import 'package:flutter/material.dart';

/// A util to keep and reuse global keys.
/// This mechanism attempts to solve the issue of using redux like design with forms.
/// Without this solution, forms are cleared for every incoming message.
class KeysStore {
  final Map<String, GlobalKey> _formKeys;

  //TODO: How can we do this: KeysStore(): _formKeys = Map<String, GlobalKey<FormState>>();
  KeysStore(): _formKeys = Map<String, GlobalKey>();

  GlobalKey<FormState> formKey(String keyString) {
    if (_formKeys[keyString] == null) {
      _formKeys[keyString] = GlobalKey<FormState>();
    }
    return _formKeys[keyString];
  }
}
