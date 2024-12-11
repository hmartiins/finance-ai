import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:image_picker/image_picker.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({
    super.key,
    this.text,
    required this.onImage,
  });

  final String? text;
  final Function(InputImage inputImage) onImage;

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  File? _image;
  String? _path;
  ImagePicker? _imagePicker;

  @override
  void initState() {
    super.initState();

    _imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _image != null
                ? SizedBox(
                    height: 350,
                    width: 350,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.file(_image!),
                      ],
                    ),
                  )
                : const Icon(
                    Icons.image,
                    size: 200,
                  ),
            const SizedBox(
              height: 18,
            ),
            if (_image != null)
              SizedBox(
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.text ?? '',
                    overflow: TextOverflow.visible,
                    softWrap: true,
                  ),
                ),
              ),
            SizedBox(
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(
                      double.infinity,
                      50,
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () => _getImage(ImageSource.gallery),
                  child: const Text(
                    'Selecionar Imagem',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future _getImage(ImageSource source) async {
    setState(() {
      _image = null;
      _path = null;
    });
    final pickedFile = await _imagePicker?.pickImage(source: source);
    if (pickedFile != null) {
      _processFile(pickedFile.path);
    }
  }

  Future _processFile(String path) async {
    setState(() {
      _image = File(path);
    });
    _path = path;
    final inputImage = InputImage.fromFilePath(path);
    widget.onImage(inputImage);
  }
}
