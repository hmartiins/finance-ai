import 'dart:async';
import 'dart:io';

import 'package:finance_ai/data/services/openai_service.dart';
import 'package:finance_ai/domain/expanse/models/expense.dart';
import 'package:finance_ai/domain/expanse/models/expense_amount_details.dart';
import 'package:finance_ai/domain/expanse/usecases/expense_create_use_case.dart';
import 'package:finance_ai/utils/command.dart';
import 'package:finance_ai/utils/result.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logging/logging.dart';

class NewExpenseViewModel extends ChangeNotifier {
  NewExpenseViewModel({
    required OpenAIService openAIService,
    required ExpenseCreateUseCase expenseCreateUseCase,
  })  : _openAIService = openAIService,
        _expenseCreateUseCase = expenseCreateUseCase {
    getImage = Command1(_getImage);
    processImageToText = Command0(_processImage);
    transformRecognizedTextToJsonByAI =
        Command0(_transformRecognizedTextToJsonByAI);
    createExpense = Command0(_createExpense);
  }

  File? _image;
  String? _path;
  String? _textImage;
  ExpenseAmountDetails? _expenseAmountDetailsRecognized;

  File? get image => _image;
  String? get path => _path;
  String? get textImage => _textImage;

  final _imagePicker = ImagePicker();

  final _log = Logger('NewExpenseViewModel');

  final OpenAIService _openAIService;
  final ExpenseCreateUseCase _expenseCreateUseCase;

  late Command1<void, ImageSource> getImage;
  late Command0<void> processImageToText;
  late Command0<void> transformRecognizedTextToJsonByAI;
  late Command0<void> createExpense;

  /// Get image from [source].
  ///
  /// After executing this command, the image file is saved in [image] and the
  /// path to the image file is saved in [path].
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

  /// Process the image to text.
  ///
  /// To process the image to recognized text, we use the [TextRecognizer] from google_mlkit_text_recognition.
  /// Image-to-text recognition is a routine that runs on the device's processor. This way, it works offline and
  /// without the need to communicate with external APIs and free of charge.
  ///
  /// If the image is processed successfully, the [_textImage] will be set.
  /// If the path of image is not set, an error will be returned.
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
      _textImage = recognizedText.text;

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

  /// Transform the recognized text to json by AI.
  ///
  /// To transform the recognized text to json by AI, we use the [transformRecognizedTextToJson] from [OpenAIService].
  Future<Result<void>> _transformRecognizedTextToJsonByAI() async {
    if (_textImage == null) {
      _log.warning('No text image to transform.');
      return Result.error(
        Exception('No text image to transform.'),
      );
    }

    _log.info('Transforming recognized text to json by AI.');

    try {
      final result =
          await _openAIService.transformRecognizedTextToJson(_textImage!);

      switch (result) {
        case Ok<ExpenseAmountDetails>():
          _expenseAmountDetailsRecognized = result.value;

          break;
        case Error<ExpenseAmountDetails>():
          return Result.error(
            Exception('Error transforming recognized text to json by AI.'),
          );
      }

      _log.info('Recognized text transformed to json by AI.');

      return const Result.ok(null);
    } catch (e) {
      _log.severe(
        'Error transforming recognized text to json by AI. Error: $e',
      );

      return Result.error(
        Exception(
          'Error transforming recognized text to json by AI. Error: $e',
        ),
      );
    }
  }

  Future<Result<void>> _createExpense() async {
    if (_expenseAmountDetailsRecognized == null) {
      return Result.error(
        Exception('No recognized amount details to create expense.'),
      );
    }

    final expense = Expense(
      createdAt: DateTime.now(),
      title: 'teste2',
      category: 'teste2',
      wallet: 'teste2',
      amountDetails: _expenseAmountDetailsRecognized!,
    );

    final result = await _expenseCreateUseCase.createFrom(expense);
    switch (result) {
      case Ok<Expense>():
        _log.fine('Created Expense');
        notifyListeners();
        return const Result.ok(null);
      case Error<Expense>():
        _log.warning('Create Expense error: ${result.error}');
        notifyListeners();
        return Result.error(result.error);
    }
  }

  /// Set the [image] and [path] to null.
  void removeImage() {
    _image = null;
    _path = null;
    notifyListeners();
  }
}
