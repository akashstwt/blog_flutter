import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage(BuildContext context) async {
  final ImagePicker picker = ImagePicker();
  File? selectedImage;

  final ImageSource? source = await showDialog<ImageSource>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Choose Image Source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(
                    context, ImageSource.gallery); // Return gallery source
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                Navigator.pop(
                    context, ImageSource.camera); // Return camera source
              },
            ),
          ],
        ),
      );
    },
  );

  if (source != null) {
    final XFile? xFile = await picker.pickImage(source: source);
    if (xFile != null) {
      selectedImage = File(xFile.path);
    }
  }

  return selectedImage;
}

// import 'dart:io';
// import 'package:image_picker/image_picker.dart';

// Future<File?> pickImage() async {
//   try {
//     final xFile = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//     );
//     if (xFile != null) {
//       return File(xFile.path);
//     }
//     return null;
//   } catch (e) {
//     return null;
//   }
// }
