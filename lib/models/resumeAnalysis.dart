class ResumeAnalysis {
  final String? id;
  final int score;
  final String summary;
  final List<String> technicalSkills;
  final List<String> softSkills;
  final List<String> strengths;
  final List<String> weaknesses;
  final List<String> recommendedSkills;
  final String atsCompatibility;
  final List<String> improvements;
  final List<String> jobRoles;

  ResumeAnalysis({
    this.id,
    required this.score,
    required this.summary,
    required this.technicalSkills,
    required this.softSkills,
    required this.strengths,
    required this.weaknesses,
    required this.recommendedSkills,
    required this.atsCompatibility,
    required this.improvements,
    required this.jobRoles,
  });

  factory ResumeAnalysis.fromJson(Map<String, dynamic> json) {
    return ResumeAnalysis(
      score: json['score'] ?? 0,
      summary: json['summary'] ?? '',
      technicalSkills:
          List<String>.from(json['technicalSkills'] ?? []),
      softSkills:
          List<String>.from(json['softSkills'] ?? []),
      strengths:
          List<String>.from(json['strengths'] ?? []),
      weaknesses:
          List<String>.from(json['weaknesses'] ?? []),
      recommendedSkills:
          List<String>.from(json['recommendedSkills'] ?? []),
      atsCompatibility:
          json['atsCompatibility'] ?? '',
      improvements:
          List<String>.from(json['improvements'] ?? []),
      jobRoles:
          List<String>.from(json['jobRoles'] ?? []),
    );
  }
  
  Map<String, dynamic> toMap() {
  return {
    'score': score,
    'summary': summary,
    'technicalSkills': technicalSkills,
    'softSkills': softSkills,
    'strengths': strengths,
    'weaknesses': weaknesses,
    'recommendedSkills': recommendedSkills,
    'atsCompatibility': atsCompatibility,
    'improvements': improvements,
    'jobRoles': jobRoles,
  };
}
}