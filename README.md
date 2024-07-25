
![nexever logo](https://nexever.com/images/logo2.png)

A Flutter package for picking files, images, and videos with options for cropping and compression.

## Features

- Pick files (PDF, DOCX, XLSX, PPTX, DOC, XLS, PPT, TXT).
- Pick images from camera or gallery with optional cropping.
- Pick videos and compress them if necessary.
- Check and request necessary permissions (camera and storage).

## Installation

Add `nex_file_picker` to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  nex_file_picker: <latest-version>
```

## Usage

Import the package in your Dart file:

```dart
import 'package:flutter/material.dart';
import 'package:nex_file_picker/nex_file_picker.dart';
import 'package:nex_file_picker/state/nex_file_picker_state.dart';
import 'package:nex_file_picker/model/return_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FilePickerHelper filePickerHelper = FilePickerHelper(MyFilePickerState());

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
```


#### Methods

- `openAttachmentDialog({List<String>? type, required String fileType})`
  Opens a dialog to pick a file with specific extensions.

- `getCropping(CropAspectRatioPreset cropAspectRatioPreset)`
  Sets the aspect ratio preset for cropping images.

- `getImageWithCropping(ImageSource imageSource, String type)`
  Picks an image from the given source and crops it if cropping is enabled.

- `getVideo(String type)`
  Picks a video and compresses it if necessary.

- `isCameraEnabled()`
  Checks if camera permissions are granted.

- `isStorageEnabled()`
  Checks if storage permissions are granted.

#### Usage Example

```dart
FilePickerHelper filePickerHelper = FilePickerHelper(MyFilePickerState());

filePickerHelper.openAttachmentDialog(fileType: "document");

filePickerHelper.getImageWithCropping(ImageSource.camera, "image");

filePickerHelper.getVideo("video");
```

# nexever_file_picker
# nexever_file_picker
