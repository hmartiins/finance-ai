// TODO: The ideal is not to leave this service linked
// to open ai but to make it receive an interface with standard methods.

// TODO: The ideal is to implement the faker class that simulates this service,
// so we don't spend time on requests all the time.

import 'dart:convert';

import 'package:finance_ai/domain/expanse/expense_amount_details.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:logging/logging.dart';

import '../../utils/result.dart';

/// Service to interact with the OpenAI API.
///
/// This service is responsible for transforming the recognized text into a JSON object.
class OpenAIService {
  static final _openApiKey = dotenv.get('OPENAI_API_KEY', fallback: 'a');
  static final model = OpenAI(
    defaultOptions: const OpenAIOptions(
      temperature: 0.2,
    ),
    apiKey: _openApiKey,
  );

  final _log = Logger('OpenAIService');

  /// Transforms the recognized text into a JSON object using the OpenAI API.
  ///
  /// Receives the recognized text and returns a JSON object, same as [ExpenseAmountDetails].
  Future<Result<ExpenseAmountDetails>> transformRecognizedTextToJson(
    String text,
  ) async {
    try {
      /// TODO: The prompt should be a constant in the class.
      final prompt = PromptValue.string("""
          Provide exclusively a JSON containing the total amount of the order, along with a list of items 
          and the price of each item. The JSON must strictly follow the structure below:
          {
            "total": <total_value>,
            "items": [
              {
                "name": "<item_name>",
                "price": <item_price>
              }
            ]
          }
          Make sure to adhere to this structure and do not include any explanations, additional text, 
          or responses outside the JSON. Below is the text that must be analyzed:
          
          $text
        """);

      final result = await model.invoke(prompt);

      _log.info('Transformed text to json by AI. Result $result');

      final responseOutput = result.output;
      final responseJson = jsonDecode(responseOutput) as ExpenseAmountDetails;

      return Result.ok(responseJson);
    } on Exception catch (e) {
      _log.warning('Failed to transform text to json by AI', e);
      return Result.error(e);
    }
  }
}
