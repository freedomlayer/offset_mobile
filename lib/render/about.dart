import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:package_info/package_info.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../actions/actions.dart';
import '../logger.dart';

// Asset file that contains core version:
const String CORE_VERSION_FILENAME = 'CORE_VERSION';

// Project website
const String PROJECT_WEBSITE = 'www.offsetcredit.org';
const String PROJECT_WEBSITE_URL = 'https://$PROJECT_WEBSITE';
const String PROJECT_EMAIL = 'real@freedomlayer.org';

const String QUOTE =
    'Until we realize that our money power is our sovereign power we cannot act as sovereigns.\n--E.C. Riegel ';

final logger = createLogger('render::about');

class VersionInfo {
  // Mobile app's version
  final PackageInfo packageInfo;
  // Core backend's version
  final String coreVersion;

  VersionInfo(this.packageInfo, this.coreVersion);
}

String dataBytesToString(ByteData byteData) {
  final buffer = byteData.buffer;
  final list =
      buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
  return utf8.decode(list).trim();
}

Future<VersionInfo> _loadVersionInfo() async {
  final packageInfo = await PackageInfo.fromPlatform();
  // Load from asset:
  final coreVersion =
      dataBytesToString(await rootBundle.load(CORE_VERSION_FILENAME));
  return VersionInfo(packageInfo, coreVersion);
}

Widget renderAbout(Function(AboutAction) queueAction) {
  return WillPopScope(
      onWillPop: () async => queueAction(AboutAction.back()),
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                  title: Text('About'),
                  leading: BackButton(
                    onPressed: () => queueAction(AboutAction.back()),
                  ),
                  bottom: TabBar(tabs: [
                    Tab(icon: const FaIcon(FontAwesomeIcons.infoCircle)),
                    Tab(icon: const FaIcon(FontAwesomeIcons.stethoscope)),
                  ])),
              body: TabBarView(children: [
                _renderVersion(queueAction),
                _renderLogs(queueAction),
              ]))));
}

Widget _renderVersion(queueAction) {
  // TODO: Possibly be able to change those functions to be async in the future,
  // hence eliminating the need to use FutureBuilder here.
  return FutureBuilder<VersionInfo>(
      future: _loadVersionInfo(),
      builder: (BuildContext context, AsyncSnapshot<VersionInfo> snapshot) {
        if (snapshot.hasData) {
          final packageInfo = snapshot.data;
          return _renderVersionAfter(packageInfo, queueAction);
        } else if (snapshot.hasError) {
          logger.e('Error loading version information: ${snapshot.error}');
          return Center(child: Text('Error loading version information!'));
        } else {
          // Waiting:
          return Center(child: CircularProgressIndicator());
        }
      });
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    logger.e('Could not launch url: $url');
  }
}

Widget _renderVersionAfter(
    VersionInfo versionInfo, Function(AboutAction) queueAction) {
  final packageInfo = versionInfo.packageInfo;
  return ListView(padding: EdgeInsets.all(8), children: [
    ListTile(
        leading: FaIcon(FontAwesomeIcons.mobileAlt),
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('App version'),
              Text(
                  '${packageInfo.appName} ${packageInfo.version}+${packageInfo.buildNumber}')
            ])),
    Divider(height: 0, color: Colors.grey),
    ListTile(
        leading: FaIcon(FontAwesomeIcons.cogs),
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Core version'),
              Text('${versionInfo.coreVersion}')
            ])),
    Divider(height: 0, color: Colors.grey),
    ListTile(
        leading: FaIcon(FontAwesomeIcons.globeAmericas),
        title: Text(PROJECT_WEBSITE, style: TextStyle(color: Colors.blue)),
        onTap: () => _launchURL(PROJECT_WEBSITE_URL)),
    Divider(height: 0, color: Colors.grey),
    ListTile(leading: FaIcon(FontAwesomeIcons.at), title: Text(PROJECT_EMAIL)),
    Divider(height: 0, color: Colors.grey),
    SizedBox(height: 10.0),
    ListTile(title: Text(QUOTE)),
  ]);
}

Widget _renderLogs(queueAction) {
  // TODO: How to make sure that this Widget redraws 
  // whenever cyclicLogOutput changes? Currently we just hope for the best.

  final List<Widget> children = [];

  for (final logStr in cyclicLogOutput) {
    children.add(Text(logStr));
    children.add(Divider(height: 8.0, color: Colors.grey));
  }

  return Padding(
    padding: EdgeInsets.all(8),
    child: SelectableText(cyclicLogOutput.reversed.join('\n\n')),
    /*
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children.reversed.toList()))
              */
  );
}
