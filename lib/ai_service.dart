import 'dart:typed_data';

class AIService {
  Future<void> loadModel() async {
    // TFLite removed because it does not support Flutter Web.
  }

  Future<AIResult> analyzeImage(Uint8List imageBytes) async {
    return AIResult(
      label: 'Handmade Craft',
      confidence: 0.0,
      description: 'AI analysis will be connected soon.',
      colors: 'Not available',
      pattern: 'Not available',
      style: 'Not available',
      material: 'Not available',
    );
  }

  void dispose() {}
}

class AIResult {
  final String label;
  final double confidence;
  final String description;
  final String colors;
  final String pattern;
  final String style;
  final String material;

  AIResult({
    required this.label,
    required this.confidence,
    required this.description,
    required this.colors,
    required this.pattern,
    required this.style,
    required this.material,
  });
}
