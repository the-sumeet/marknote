import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marknote/data/current_dir.dart';

import '../../data/files.dart';

class FileExplorer extends ConsumerWidget {
  const FileExplorer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String currentDir = ref.watch(currentDirProvider);
    List<dynamic> files = ref.watch(filesProvider);

    return Drawer(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: ListView(
        children: [
          if (currentDir != "/")
            ListTile(
              leading: Icon(Icons.folder),
              title: Text(".."),
              onTap: () {
                ref.read(currentDirProvider.notifier).set(Directory(currentDir).parent.path);
              },
            ),

          ...files.map((file) {
            dynamic leading;
            var name = "";

            if (file is File) {
              name = (file as File).absolute.path;
            } else if(file is Directory) {
              leading = Icon(Icons.folder);
              name = (file as Directory).absolute.path;
            }

            return ListTile(
              leading: leading,
              title: Text(name),
              onTap: () {
                if (file is File) {
                } else {
                  ref
                      .read(currentDirProvider.notifier)
                      .set((file as Directory).absolute.path);
                }
              },
            );
          }).toList()
        ],
      ),
      // child: ListView.builder(
      //   itemCount: files.length,
      //   itemBuilder: (context, i) {
      //     dynamic leading;
      //     var name = "";
      //
      //     if (files[i] is File) {
      //       name = (files[i] as File).absolute.path;
      //     } else {
      //       leading = Icon(Icons.folder);
      //       name = (files[i] as Directory).absolute.path;
      //     }
      //
      //     return ListTile(
      //       leading: leading,
      //       title: Text(name),
      //       onTap: () {
      //         if (files[i] is File) {
      //
      //         } else {
      //           ref.read(currentDirProvider.notifier).set((files[i] as Directory).absolute.path);
      //         }
      //       },
      //     );
      //   },
      // ),
    );
  }
}
