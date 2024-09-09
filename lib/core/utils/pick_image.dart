// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// Future<File?> pickImage(BuildContext context) async {
//   final ImagePicker picker = ImagePicker();
//   File? selectedImage;

//   // Function to show the dialog for choosing the image source
//   await showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('Choose Image Source'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ListTile(
//               leading: const Icon(
//                 Icons.photo_library,
//               ),
//               title: const Text('Gallery'),
//               onTap: () async {
//                 Navigator.pop(
//                     context); // Close the dialog before picking the image
//                 final XFile? xFile = await picker.pickImage(
//                   source: ImageSource.gallery,
//                 );
//                 if (xFile != null) {
//                   selectedImage = File(xFile.path);
//                 }
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.camera_alt),
//               title: const Text('Camera'),
//               onTap: () async {
//                 Navigator.pop(
//                     context); // Close the dialog before picking the image
//                 final XFile? xFile = await picker.pickImage(
//                   source: ImageSource.camera,
//                 );
//                 if (xFile != null) {
//                   selectedImage = File(xFile.path);
//                 }
//               },
//             ),
//           ],
//         ),
//       );
//     },
//   );

//   return selectedImage;
// }

import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage() async {
  try {
    final xFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (xFile != null) {
      return File(xFile.path);
    }
    return null;
  } catch (e) {
    return null;
  }
}
