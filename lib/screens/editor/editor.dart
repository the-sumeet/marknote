import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:markdown/markdown.dart' as md;

import 'file_explorer.dart';
class EditorScreen extends StatefulWidget {

  EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MarkNote'),
        elevation: 2,
      ),
      body: Row(
        children: [
          FileExplorer(),
          Expanded(
            child: TextField(
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(8),
                // ),
              ),
              controller: controller,
              expands: true,
              maxLines: null,
              textAlignVertical: TextAlignVertical.top,
              keyboardType: TextInputType.multiline,
            ),
          ),
          VerticalDivider(),
          Expanded(
            child: Markdown(
              selectable: true,
              data: controller.text,
              onTapLink: (text, url, title){
                if (url != null) {
                  //[dfdf](http://example.com)
                  print('Link: $url');
                  launchUrl(Uri.parse(url)); /*For url_launcher 6.1.0 and higher*/
                }
                // launch(url);  /*For url_launcher 6.0.20 and lower*/
              },
              extensionSet: md.ExtensionSet(
                md.ExtensionSet.gitHubWeb.blockSyntaxes,
                [
                  md.EmojiSyntax(),
                  md.InlineHtmlSyntax(),
                  md.LinkSyntax(),
                  md.ImageSyntax(),
                  ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes
                ],

              ),
            ),
          )
        ],
      ),
    );
  }
}
