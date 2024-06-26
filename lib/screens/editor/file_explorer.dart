import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FileExplorer extends ConsumerWidget {
  const FileExplorer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero
      ),
      child: ListView(
        children: [
          ListTile(
            title: Text('About'),
            onTap: () {
              // Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
