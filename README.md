<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
# Logger_plus

know whether this package might be useful for them.
Small, easy to use and extensible logger which prints beautiful logs.<br>
Inspired by [logger](https://github.com/orhanobut/logger) for Android.

**Show some ❤️ and star the repo to support the project**

## Getting Started

Just create an instance of `Logger` and start logging:
```dart
var logger = Logger();

logger.d("Logger is working!");
```

Instead of a string message, you can also pass other objects like `List`, `Map` or `Set`.

## Output

![](https://raw.githubusercontent.com/leisim/logger/master/art/screenshot.png)

# Documentation

## Log level

You can log with different levels:

```dart
logger.v("Verbose log");

logger.d("Debug log");

logger.i("Info log");

logger.w("Warning log");

logger.e("Error log");

logger.wtf("What a terrible failure log");
```

To show only specific log levels, you can set:

```dart
Logger.level = Level.warning;
```

This hides all `verbose`, `debug` and `info` log events.

## Options

When creating a logger, you can pass some options:

```dart
var logger = Logger(
  filter: null, // Use the default LogFilter (-> only log in debug mode)
  printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
  output: null, // Use the default LogOutput (-> send everything to console)
);
```

If you use the `PrettyPrinter`, there are more options:

```dart
var logger = Logger(
  printer: PrettyPrinter(
    methodCount: 2, // number of method calls to be displayed
    errorMethodCount: 8, // number of method calls if stacktrace is provided
    lineLength: 120, // width of the output
    colors: true, // Colorful log messages
    printEmojis: true, // Print an emoji for each log message
    printTime: false // Should each log print contain a timestamp
  ),
);
```
## Log Console

Shake the phone or call LogConsole.open(context) from anywhere to show an on device console.
![](https://raw.githubusercontent.com/leisim/logger/master/art/log_console_light.png)
![](https://raw.githubusercontent.com/leisim/logger/master/art/log_console_light.png)

### Auto detecting

With the `io` package you can auto detect the `lineLength` and `colors` arguments.
Assuming you have imported the `io` package with `import 'dart:io' as io;` you
can auto detect `colors` with `io.stdout.supportsAnsiEscapes` and `lineLength`
with `io.stdout.terminalColumns`.

You should probably do this unless there's a good reason you don't want to
import `io`, for example when using this library on the web.

## LogFilter

The `LogFilter` decides which log events should be shown and which don't.<br>
The default implementation (`DevelopmentFilter`) shows all logs with `level >= Logger.level` while in debug mode. In release mode all logs are omitted.

You can create your own `LogFilter` like this:
```dart
class MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
```
This will show all logs even in release mode. (**NOT** a good idea)


## LogPrinter

The `LogPrinter` creates and formats the output, which is then sent to the `LogOutput`.<br>
You can implement your own `LogPrinter`. This gives you maximum flexibility.

A very basic printer could look like this:
```dart
class MyPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    return [event.message];
  }
}
```

If you created a cool `LogPrinter` which might be helpful to others, feel free to open a pull request. :)

### Colors

Please note that all IDEs (VSCode, XCode, Android Studio, IntelliJ) do not
support ANSI escape sequences in their terminal outputs. These escape sequences
are used to color output. If using such an IDE do not configure colored output.

However, if you are using a JetBrains IDE (Android Studio, IntelliJ, etc.)
you can make use of the [Grep Console Plugin](https://plugins.jetbrains.com/plugin/7125-grep-console)
and the [`PrefixPrinter`](/lib/src/printers/prefix_printer.dart)
decorator to achieved colored logs for any logger:

```dart
var logger = Logger(
  printer: PrefixPrinter(PrettyPrinter(colors: false))
);
```

## LogOutput

`LogOutput` sends the log lines to the desired destination.<br>
The default implementation (`ConsoleOutput`) send every line to the system console.

```dart
class ConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      print(line);
    }
  }
}
```

Possible future `LogOutput`s could send to a file, firebase or to Logcat. Feel free to open pull requests.


## logger_flutter extension

The logger_plus package is an extension for logger. You can add it to any Flutter app. Just shake the phone to show the console.


start using the package.

## Usage


to `/example` folder. 

```dart
const like = 'sample';
```

