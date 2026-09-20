import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiService {
  static const String model = 'gemini-3.8-flash';

  static Future<String> analyzeResume(String resumeText) async {
    final String apiKey = dotenv.get('GEMINI_API_KEY');
    const String url =
        'https://generativelanguage.googleapis.com/v1beta/models/$model:generateContent';

    final String prompt =
        '''
        You are a professional resume analyzer.
        Analyze the resume provided below.
        Evaluate the resume based only on the information provided.

        Provide:
        - Overall resume score out of 100
        - Professional summary
        - Technical skills
        - Soft skills
        - Strengths
        - Weaknesses
        - Missing or recommended skills
        - ATS compatibility
        - Specific improvements
        - Suitable job roles

        Return ONLY valid JSON.

        The JSON must follow this structure:

        {
          "score": 0,
          "summary": "",
          "technicalSkills": [],
          "softSkills": [],
          "strengths": [],
          "weaknesses": [],
          "recommendedSkills": [],
          "atsCompatibility": "",
          "improvements": [],
          "jobRoles": []
        }

        Resume:

        $resumeText
        ''';

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json', 'x-goog-api-key': apiKey},
      body: jsonEncode({
        'contents': [
          {
            'parts': [
              {'text': prompt},
            ],
          },
        ],
        'generationConfig': {'responseMimeType': 'application/json'},
      }),
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Gemini API Error: ${response.statusCode}\n${response.body}',
      );
    }

    final Map<String, dynamic> data = jsonDecode(response.body);

    final String result = data['candidates'][0]['content']['parts'][0]['text'];

    return result;
  }
}
