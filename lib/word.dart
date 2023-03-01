class Word {
  final String topic;
  final String english;
  final String arabic;
  final String pronunciation;

  Word(
      {required this.topic,
      required this.arabic,
      required this.english,
      required this.pronunciation});

  Map<String, dynamic> toMap() {
    return {
      'topic': topic,
      'english': english,
      'arabic': arabic,
      'pronunciation': pronunciation,
    };
  }

  factory Word.fromMap({required Map<String, dynamic> map}) {
    return Word(
        topic: map['topic'],
        arabic: map['arabic'],
        english: map['english'],
        pronunciation: map['pronunciation']);
  }
}
