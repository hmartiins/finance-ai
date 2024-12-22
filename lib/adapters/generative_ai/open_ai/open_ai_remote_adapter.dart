import 'dart:convert';

import 'package:finance_ai/adapters/generative_ai/generative_ai_adapter.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:logging/logging.dart';

class OpenAIRemoteAdapter implements IGenerativeAIAdapter {
  final OpenAI openAIInstance;

  OpenAIRemoteAdapter({
    required this.openAIInstance,
  });

  final _log = Logger('OpenAIRemoteAdapter');

  /// Transforma um texto bruto em uma entidade estruturada do tipo [T].
  ///
  /// Este método utiliza IA generativa para interpretar o texto e mapeá-lo para um objeto de entidade.
  /// - [text]: O texto a ser transformado.
  /// - [jsonTemplate]: Um exemplo de JSON que a IA espera receber para mapear o texto.
  /// - [fromJson]: Uma função para mapear o JSON retornado pela IA para a entidade desejada.
  @override
  Future<T?> transformTextToEntity<T>(
    String text,
    String jsonTemplate,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final prompt = PromptValue.string("""
          Provide exclusively a JSON containing the total amount of the order, along with a list of items 
          and the price of each item. The JSON must strictly follow the structure below:
          $jsonTemplate
          Make sure to adhere to this structure and do not include any explanations, additional text, 
          or responses outside the JSON. Below is the text that must be analyzed:
          
          $text
        """);

    final result = await openAIInstance.invoke(prompt);

    _log.info('Transformed text to Entity ($T) by AI. Result: $result');

    final responseOutput = jsonDecode(result.output);
    return fromJson(responseOutput);
  }
}
