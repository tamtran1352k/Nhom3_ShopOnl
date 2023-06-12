import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class ImageUploadPage extends StatefulWidget {
  @override
  _ImageUploadPageState createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage> {
  File? _image;

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) {
      return;
    }

    final fileName = path.basename(_image!.path);
    final appDocDir = await getApplicationDocumentsDirectory();
    final filePath = '${appDocDir.path}/$fileName';

    // Copy the selected image to the app's document directory
    await _image!.copy(filePath);
    final file = File(filePath);

    // Create the file metadata
    final metadata = SettableMetadata(contentType: 'image/jpeg');

    // Create a reference to the Firebase Storage bucket
    final storageRef = FirebaseStorage.instance.ref();

    // Upload file and metadata to the path 'images/path/to/mountains.jpg'
    final uploadTask =
        storageRef.child('images/path/to/$fileName').putFile(file, metadata);

    // Listen for state changes, errors, and completion of the upload.
    uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
      switch (taskSnapshot.state) {
        case TaskState.running:
          final progress =
              100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
          print('Upload is $progress% complete.');
          break;
        case TaskState.paused:
          print('Upload is paused.');
          break;
        case TaskState.canceled:
          print('Upload was canceled.');
          break;
        case TaskState.error:
          // Handle unsuccessful uploads
          print('Upload error: ${taskSnapshot}');
          break;
        case TaskState.success:
          // Handle successful uploads on complete
          print('Upload complete.');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_image != null)
              Image.file(
                _image!,
                height: 200,
              ),
            ElevatedButton(
              onPressed: _getImageFromGallery,
              child: Text('Select Image'),
            ),
            ElevatedButton(
              onPressed: _image != null ? _uploadImage : null,
              child: Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}
