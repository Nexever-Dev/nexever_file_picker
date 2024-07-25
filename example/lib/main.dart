import 'package:flutter/material.dart';
import 'package:nexever_file_picker/model/return_model.dart';

import 'package:nexever_file_picker/nexever_file_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FilePickerHelper filePickerHelper =
      FilePickerHelper(MyFilePickerState());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('File Picker Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              filePickerHelper.openAttachmentDialog(fileType: "document");
            },
            child: Text('Pick Document'),
          ),
        ),
      ),
    );
  }
}

class MyFilePickerState extends NexFilePickerState {
  @override
  void success({ReturnModel? fileData, String? type}) {
    print('File picked: ${fileData!.fileName}');
    // Implement your success handling here
  }

  @override
  void error(var error) {
    print('Error picking file: $error');
    // Implement your error handling here
  }
}
