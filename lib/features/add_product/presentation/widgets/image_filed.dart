import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onFileChanged});
  final ValueChanged<File?> onFileChanged;
  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          isLoading = true;
          setState(() {});
          try {
            await pickerImage();
          } on Exception catch (e) {
            // TODO
            // print(e);
          }
          isLoading = false;
          setState(() {});
        },

        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
              ),
              child: imageFile != null
                  ? Image.file(imageFile!)
                  : const Icon(Icons.image_outlined, size: 180),
            ),
            IconButton(
              onPressed: () => setState(() {
                imageFile = null;
                widget.onFileChanged(null);
              }),
              icon: Visibility(
                visible: imageFile != null,
                child: Icon(Icons.delete, color: Colors.red, size: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickerImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageFile = File(image.path);
      widget.onFileChanged(imageFile!);
    }
  }
}
