import 'dart:io';

import 'package:marknote/data/current_dir.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:io' as io;
part 'files.g.dart';


@riverpod
class Files extends _$Files {
  @override
  List<dynamic> build() {
    String? currentDir = ref.watch(currentDirProvider);
    if (currentDir == null) {
      return [];
    }
    var file = io.Directory(currentDir).listSync();
    return file;
  }
}

