library logger_plus;

import 'dart:collection';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger_plus/src/ansi_parser.dart';
import 'package:logger_plus/src/logger.dart';
import 'package:logger_plus/src/shake_detector.dart';

export 'src/ansi_color.dart';
export 'src/filters/development_filter.dart';
export 'src/filters/production_filter.dart';
export 'src/log_filter.dart';
export 'src/log_output.dart'
    if (dart.library.io) 'src/outputs/file_output.dart';
export 'src/log_output.dart';
export 'src/log_printer.dart';
export 'src/logger.dart';
export 'src/outputs/console_output.dart';
export 'src/outputs/memory_output.dart';
export 'src/outputs/multi_output.dart';
export 'src/outputs/stream_output.dart';
export 'src/printers/hybrid_printer.dart';
export 'src/printers/logfmt_printer.dart';
export 'src/printers/prefix_printer.dart';
export 'src/printers/pretty_printer.dart';
export 'src/printers/simple_printer.dart';

part 'src/log_console.dart';
part 'src/log_console_on_shake.dart';
