import 'package:injectable/injectable.dart';
import 'dart:math';
import '../../domain/entities/chat_message_entity.dart';

@lazySingleton
class LocalChatDatasource {
  // ──────────────────────────────────────────
  // Rule tables
  // ──────────────────────────────────────────
  static const _greetings = [
    'hello', 'hi', 'hey', 'good morning', 'good evening',
    'مرحبا', 'أهلا', 'هلا', 'السلام عليكم',
  ];

  static const _greetingReplies = [
    "Hello! 👋 I'm Hayat Care's health assistant. How can I help you today?",
    "Hi there! I'm here to answer your general health questions. What's on your mind?",
    "Hey! Feel free to ask me any general health question.",
  ];

  static const _disclaimer =
      '\n\n⚠️ *Disclaimer: This assistant does not provide medical diagnosis or treatment recommendations. Please consult a qualified doctor for any medical concerns.*';

  static final _rules = <_ChatRule>[
    _ChatRule(
      keywords: ['headache', 'head pain', 'migraine', 'صداع'],
      response:
      'Headaches can be caused by many factors such as dehydration, stress, lack of sleep, or eye strain. Drinking water, resting in a quiet dark room, and reducing screen time often helps. If headaches are frequent or severe, please see a doctor.',
    ),
    _ChatRule(
      keywords: ['fever', 'temperature', 'high temp', 'حمى', 'سخونة'],
      response:
      'A mild fever is often the body\'s natural response to infection. Stay hydrated, rest, and use a light blanket. If the fever exceeds 39°C or lasts more than 3 days, medical attention is recommended.',
    ),
    _ChatRule(
      keywords: ['cold', 'flu', 'cough', 'runny nose', 'زكام', 'كحة', 'انفلونزا'],
      response:
      'Common cold symptoms typically resolve within 7–10 days. Rest, fluids, and steam inhalation can ease symptoms. Honey and warm liquids may soothe a sore throat.',
    ),
    _ChatRule(
      keywords: ['sleep', 'insomnia', 'can\'t sleep', 'نوم', 'أرق'],
      response:
      'Good sleep hygiene includes keeping a consistent sleep schedule, avoiding screens before bed, limiting caffeine after noon, and keeping your room cool and dark. Adults need 7–9 hours of sleep per night.',
    ),
    _ChatRule(
      keywords: ['diet', 'nutrition', 'eat', 'food', 'weight', 'غذاء', 'أكل', 'وزن'],
      response:
      'A balanced diet rich in vegetables, fruits, whole grains, and lean proteins supports good health. Try to limit processed foods, added sugar, and saturated fats. Stay hydrated with 8 glasses of water daily.',
    ),
    _ChatRule(
      keywords: ['exercise', 'workout', 'fitness', 'تمرين', 'رياضة'],
      response:
      'Regular physical activity — even 30 minutes of walking daily — can significantly improve heart health, mood, and energy levels. Aim for at least 150 minutes of moderate activity per week.',
    ),
    _ChatRule(
      keywords: ['stress', 'anxiety', 'worried', 'mental', 'ضغط', 'قلق'],
      response:
      'Managing stress is important for overall health. Deep breathing, mindfulness, regular exercise, and talking to someone you trust can help. If anxiety significantly affects your daily life, speaking with a mental health professional is beneficial.',
    ),
    _ChatRule(
      keywords: ['blood pressure', 'hypertension', 'ضغط الدم'],
      response:
      'Maintaining healthy blood pressure involves a low-sodium diet, regular exercise, limiting alcohol, not smoking, and managing stress. Normal blood pressure is generally below 120/80 mmHg.',
    ),
    _ChatRule(
      keywords: ['diabetes', 'sugar', 'glucose', 'سكر', 'سكري'],
      response:
      'Managing blood sugar involves a balanced diet low in refined carbohydrates, regular exercise, and monitoring your levels. If you suspect diabetes, a fasting blood glucose test through your doctor is the right first step.',
    ),
    _ChatRule(
      keywords: ['vitamin', 'supplement', 'فيتامين', 'مكمل'],
      response:
      'Common vitamins important for health include Vitamin D, B12, Iron, and Omega-3 fatty acids. A healthy varied diet usually covers most needs. Supplements are best taken based on a blood test and doctor\'s recommendation.',
    ),
    _ChatRule(
      keywords: ['thank', 'thanks', 'شكر', 'شكرا', 'مشكور'],
      response:
      'You\'re welcome! 😊 I\'m always here if you have more questions. Take care of your health!',
      includeDisclaimer: false,
    ),
    _ChatRule(
      keywords: ['bye', 'goodbye', 'see you', 'مع السلامة', 'باي'],
      response:
      'Take care! Stay healthy. Goodbye! 👋',
      includeDisclaimer: false,
    ),
  ];

  static const _fallbackReplies = [
    "I'm not sure I understood that. Could you rephrase your health question? I can help with general topics like nutrition, sleep, exercise, or common symptoms.",
    "That's outside what I can confidently answer. For specific medical questions, please consult a licensed doctor through Hayat Care's appointment feature.",
    "I didn't catch that. Try asking me about general health topics like diet, hydration, sleep, or common symptoms.",
  ];

  // ──────────────────────────────────────────
  // Public API
  // ──────────────────────────────────────────

  Future<String> getTextResponse(String userInput) async {
    await Future.delayed(const Duration(milliseconds: 1200)); // simulate latency

    final input = userInput.toLowerCase().trim();

    // Greetings check
    for (final g in _greetings) {
      if (input.contains(g)) {
        return _greetingReplies[Random().nextInt(_greetingReplies.length)];
      }
    }

    // Rule-based check
    for (final rule in _rules) {
      for (final kw in rule.keywords) {
        if (input.contains(kw)) {
          return rule.includeDisclaimer
              ? rule.response + _disclaimer
              : rule.response;
        }
      }
    }

    // Fallback
    return _fallbackReplies[Random().nextInt(_fallbackReplies.length)] +
        _disclaimer;
  }

  Future<String> getFileResponse(MessageType type) async {
    await Future.delayed(const Duration(milliseconds: 1500));

    if (type == MessageType.image) {
      return 'I\'ve received your image. Based on a general review, the values appear within a typical range. However, an accurate interpretation requires a qualified medical professional.$_disclaimer';
    }

    return 'I\'ve received your PDF report. The document has been noted. For a proper interpretation of lab results or medical reports, please share them with your doctor.$_disclaimer';
  }
}

// ──────────────────────────────────────────
// Internal helper
// ──────────────────────────────────────────
class _ChatRule {
  final List<String> keywords;
  final String response;
  final bool includeDisclaimer;

  const _ChatRule({
    required this.keywords,
    required this.response,
    this.includeDisclaimer = true,
  });
}