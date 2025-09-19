import 'package:flutter/material.dart';
import 'package:nexever_file_picker/model/return_model.dart';
import 'package:nexever_file_picker/nexever_file_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('File Picker Example'),
          ),
          body: FilePickerScreen()
      ),
    );
  }
}


class FilePickerScreen extends StatefulWidget {
  @override
  State<FilePickerScreen> createState() => _FilePickerScreenState();
}

class _FilePickerScreenState extends State<FilePickerScreen>
    implements NexFilePickerState {

  String _selectedFileName = 'No file selected';
  String _fileInfo = '';

  late FilePickerHelper filePickerHelper;

  @override
  void initState() {
    super.initState();
    filePickerHelper = FilePickerHelper(this);
  }

  @override
  void success({ReturnModel? fileData, String? type}) {
    setState(() {
      _selectedFileName = fileData?.fileName ?? 'Unknown file';
      _fileInfo = '''
              File Type: $type
              File Size: ${(fileData?.size ?? 0) / 1024} KB
              Extension: ${fileData?.fileExtension ?? 'Unknown'}
              Path: ${fileData?.filePath ?? 'Unknown'}
             ''';
    });
  }

  @override
  void error(dynamic error) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("File picker"),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                filePickerHelper.openAttachmentDialog(fileType: "document");
              },
              child: const Text('Pick Document'),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selected File:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(_selectedFileName),
                    if (_fileInfo.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Text(_fileInfo),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}