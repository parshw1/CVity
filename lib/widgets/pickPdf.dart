import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

Future<void> pickPdf() async {
PlatformFile? file = await FilePicker.pickFile(
  type: FileType.custom,
  allowedExtensions: ['pdf'],
);

if (file != null) {
  print(file.name);
  print(await file.length());
} else {
  Text('No file selected');
}}