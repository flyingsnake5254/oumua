import 'package:oumua/core/models/word.dart';
import 'package:oumua/ui/base/base_view_model.dart';

class WordListViewModel extends BaseViewModel {
  String chapter = "";
  List<Word> wordList = [];

  void init(String chapter) {
    this.chapter = chapter;
    wordList = globalViewModel.words[chapter]!.cast<Word>();
  }

  void speakCard(int index) async{
    Word word = wordList[index];
    await globalViewModel.speakEN(word.wordEN);
    await globalViewModel.speakZH(word.wordZH);
    await globalViewModel.speakEN(word.exSentenceEN);
    await globalViewModel.speakZH(word.exSentenceZH);
  }
}