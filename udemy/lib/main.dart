import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local file read/write Demo',
      home: ReadWriteFileExample(),
    );
  }
}

class ReadWriteFileExample extends StatefulWidget {
  @override
  _ReadWriteFileExampleState createState() => _ReadWriteFileExampleState();
}

class _ReadWriteFileExampleState extends State<ReadWriteFileExample> {
  final TextEditingController _textController = TextEditingController();
  String localFileContent = '';
  static const String kLocalFileName = 'demo_localfile.txt';
  String localFilePath = '';


  @override
  void initState() {
    super.initState();
    log('sdsds');
    this._readTextFromLocalFile();
    this._getLocalFile.then((file) => setState(() => {
      log(file.path),
      this.localFilePath = file.path
    }));
  }

  @override
  Widget build(BuildContext context) {
    FocusNode textFieldFocusNode = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Text('Local file read/write Demo'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          Text('Write to local file:', style: TextStyle(fontSize: 20)),
          TextField(
              focusNode: textFieldFocusNode,
              controller: _textController,
              maxLines: null,
              style: TextStyle(fontSize: 20)
          ),
          ButtonBar(
            children: <Widget>[
              MaterialButton(
                child: Text('Load', style: TextStyle(fontSize: 20)),
                onPressed: () async {
                  this._readTextFromLocalFile();
                  this._textController.text = this.localFileContent;
                  FocusScope.of(context).requestFocus(textFieldFocusNode);
                  log('String success loaded from local file');
                },
              ),
              MaterialButton(
                child: Text('Save', style: TextStyle(fontSize: 20)),
                onPressed: () async {
                  await this._writeTextLocalFile(this._textController.text);
                  this._textController.clear();
                  await this._readTextFromLocalFile();
                  log('String success loaded from local file');
                },
              ),
            ],
          ),
          Divider(height: 20.0),
          Text(this.localFilePath, style: Theme.of(context).textTheme.headline6),
          Text('demo_localfile.txt', style: Theme.of(context).textTheme.subtitle1),
          Divider(height: 20.0),
          Text('Local file content:', style: Theme.of(context).textTheme.headline6),
          Text(this.localFileContent, style: Theme.of(context).textTheme.subtitle1),
        ],
      ),
    );
  }

  Future<String> get _getLocalPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _getLocalFile async {
    final String path = await _getLocalPath;
    return File('${path}/${kLocalFileName}');
  }
  
  Future<File> _writeTextLocalFile(String text) async {
    final file = await _getLocalFile;
    return file.writeAsString(text);
  }

  Future _readTextFromLocalFile() async {
    String content;
    try {
      final file = await _getLocalFile;
      content = await file.readAsString();
    } catch(e) {
      content = 'Error loading local file $e';
    }
    setState(() {
      this.localFileContent = content;
    });
  }
}