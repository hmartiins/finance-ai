import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:langchain_openai/langchain_openai.dart';

class OpenAiOptions {
  static final openAiApiKey = dotenv.get('OPENAI_API_KEY');

  static const temperature = 0.2;
  static const maxTokens = 3300;

  static final openAiInstance = OpenAI(
    defaultOptions: const OpenAIOptions(
      temperature: temperature,
      maxTokens: maxTokens,
    ),
    apiKey: openAiApiKey,
  );
}
