import 'package:logger/logger.dart';

class SimpleLogPrinter extends LogPrinter {
  final String moduleName;
  SimpleLogPrinter(this.moduleName);
  @override
  List<String> log(LogEvent logEvent) {
    var color = PrettyPrinter.levelColors[logEvent.level];
    var emoji = PrettyPrinter.levelEmojis[logEvent.level];
    return [color('$emoji ${this.moduleName} - ${logEvent.message}')];
  }
}

Logger createLogger(String moduleName) {
  return Logger(printer: SimpleLogPrinter(moduleName));
}
