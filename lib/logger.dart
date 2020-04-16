import 'package:logger/logger.dart';

// Maximum past log events we are willing to keep in memory
const int MAX_LOG_EVENTS = 0x200;
// Globally saved log events
List<String> cyclicLogOutput = [];

/// Add a log entry to in memory cyclic log:
_addLogCyclic(String logString) {
  // Add event to kept events cyclic list:
  cyclicLogOutput.add(logString);
  // .add('[${event.level.toString()}] ${event.lines.join('\n')}');

  if (cyclicLogOutput.length > MAX_LOG_EVENTS) {
    // If we have exceeded maximum events, we remove the first event:
    cyclicLogOutput.removeAt(0);
  }
}

/// Return log level as a compact string
String _levelToString(Level level) {
  final parts = level.toString().split('.');
  if (parts.length != 2) {
    // We couldn't parse the level:
    return '?';
  } else {
    return parts[1];
  }
}

class SimpleLogPrinter extends LogPrinter {
  final String moduleName;
  SimpleLogPrinter(this.moduleName);
  @override
  List<String> log(LogEvent logEvent) {
    // TODO: This is a hack: We redirect colorless and emojiless log output
    // to the cyclic in memory log store
    final currentTime = DateTime.now();
    _addLogCyclic(
        '[$currentTime:${_levelToString(logEvent.level)}] ${this.moduleName}: ${logEvent.message}');

    var color = PrettyPrinter.levelColors[logEvent.level];
    var emoji = PrettyPrinter.levelEmojis[logEvent.level];
    return [color('$emoji ${this.moduleName} - ${logEvent.message}')];
  }
}

/// A custom output logger that also keeps the last log events in memory
class CyclicConsoleOutput extends ConsoleOutput {
  @override
  void output(OutputEvent event) {
    super.output(event);
  }
}

/// Release filter, logging all messages, even in release mode
class ReleaseFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    if (event.level.index >= level.index) {
      return true;
    } else {
      return false;
    }
  }
}

Logger createLogger(String moduleName) {
  return Logger(filter: ReleaseFilter(), printer: SimpleLogPrinter(moduleName));
}
