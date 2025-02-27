import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key, required this.onPickImage});

  final void Function(File pickedImage) onPickImage;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImageFile;

  void _pickImage() async {
    final ImagePicker picker = ImagePicker();
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text('Choose Image Source'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.camera),
                    title: const Text('Camera'),
                    onTap: () async {
                      Navigator.of(ctx).pop();
                      final pickedImage = await picker.pickImage(
                        source: ImageSource.camera,
                        imageQuality: 50,
                        maxWidth: 150,
                      );
                      _handleImagePicked(pickedImage);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.image),
                    title: const Text('Gallery'),
                    onTap: () async {
                      Navigator.of(ctx).pop();
                      final pickedImage = await picker.pickImage(
                        source: ImageSource.gallery,
                        imageQuality: 50,
                        maxWidth: 150,
                      );
                      _handleImagePicked(pickedImage);
                    },
                  ),
                ],
              ),
            ),
          ),
    );
  }

  void _handleImagePicked(XFile? pickedImage) {
    if (pickedImage == null) return;
    setState(() => _pickedImageFile = File(pickedImage.path));
    widget.onPickImage(_pickedImageFile!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Color(0xffc47c51),
          foregroundImage:
              _pickedImageFile != null
                  ? FileImage(_pickedImageFile!)
                  : const AssetImage('assets/Profile.jpg') as ImageProvider,
        ),
        TextButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.image, color: Color(0xffc47c51)),
          label: const Text(
            'Update your image',
            style: TextStyle(
              color: Color(0xffc47c51),
              fontWeight: FontWeight.bold,
              fontFamily: "DopisBold",
            ),
          ),
        ),
      ],
    );
  }
}
