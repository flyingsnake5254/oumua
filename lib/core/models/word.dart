class Word {
  String wordEN = ""; // 英文單字
  String wordZH = ""; // 中文
  String kk = ""; // kk 音標
  String exSentenceEN = ""; // 英文例句
  String exSentenceZH = ""; // 翻譯
  int practiceTimes = 0; // 評量次數
  int practiceCorrect = 0; // 評量正確率
  int testTimes = 0; // 測驗次數
  int testCorrect = 0;  // 測驗正確率

  Word(this.wordEN, this.wordZH, this.kk, this.exSentenceEN, this.exSentenceZH,
      this.practiceTimes, this.practiceCorrect, this.testTimes,
      this.testCorrect);
}