import 'dart:convert';

import 'package:finance_ai/adapters/generative_ai/generative_ai_adapter.dart';
import 'package:logging/logging.dart';

class OpenAILocalAdapter implements IGenerativeAIAdapter {
  OpenAILocalAdapter();

  final _log = Logger('OpenAILocalAdapter');

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
    _log.info('Transforming text to Entity ($T) by AI...');

    await Future.delayed(const Duration(seconds: 2)); // Simulate service delay

    final responseOutput = jsonDecode(jsonTemplate);
    return fromJson(responseOutput);
  }
}
