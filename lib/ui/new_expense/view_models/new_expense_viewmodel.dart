import 'dart:async';
import 'dart:io';

import 'package:finance_ai/utils/command.dart';
import 'package:finance_ai/utils/result.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logging/logging.dart';

class NewExpenseViewModel extends ChangeNotifier {
  NewExpenseViewModel() {
    getImage = Command1(_getImage);
    processImageToText = Command0(_processImage);
  }

  File? _image;
  String? _path;
  String? _textImage;

  File? get image => _image;
  String? get path => _path;
  String? get textImage => _textImage;

  final _imagePicker = ImagePicker();

  final _log = Logger('HomeViewModel');

  late Command1<void, ImageSource> getImage;
  late Command0<void> processImageToText;

  Future<Result<void>> _getImage(ImageSource source) async {
    try {
      _log.info('Getting image from source: $source');

      _image = null;
      _path = null;

      final pickedFile = await _imagePicker.pickImage(source: source);

      if (pickedFile != null && pickedFile.path.isNotEmpty) {
        _path = pickedFile.path;
        _image = File(pickedFile.path);

        _log.info('Image loaded from source: $source');
      }

      return const Result.ok(null);
    } catch (e) {
      _log.severe('Error getting image from source: $source. Error: $e');

      return Result.error(
        Exception('Error getting image from source: $source. Error: $e'),
      );
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> _processImage() async {
    if (_path == null) {
      return Result.error(
        Exception('No path image to process.'),
      );
    }

    _log.info('Processing image to text.');

    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    try {
      _textImage = null;

      final inputImage = InputImage.fromFilePath(_path!);

      final recognizedText = await textRecognizer.processImage(inputImage);
      _textImage = 'Recognized text:\n\n${recognizedText.text}';

      _log.info('Image processed to text.');

      return const Result.ok(null);
    } catch (e) {
      _log.severe('Error to procces image to text. Error: $e');

      return Result.error(
        Exception('Error to procces image to text. Error: $e'),
      );
    } finally {
      textRecognizer.close();
      notifyListeners();
    }
  }

  void removeImage() {
    _image = null;
    _path = null;
    notifyListeners();
  }
}
