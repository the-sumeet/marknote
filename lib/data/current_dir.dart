import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_dir.g.dart';


@riverpod
class CurrentDir extends _$CurrentDir {
  @override
  String build() {
    _getHomeDir();
    return "";
  }

  void _getHomeDir() {
    String os = Platform.operatingSystem;
    String? home = "";
    Map<String, String> envVars = Platform.environment;
    if (Platform.isMacOS) {
      home = envVars['HOME'];
    } else if (Platform.isLinux) {
      home = envVars['HOME'];
    }
    stdout.writeln(home);
  }
}