class Problem {
  /*
    T1：題目、四個選項、答案
    T2：題目、答案 ----打字輸入
    T3：圖片檔名、四個選項、答案

    T4：題目（念）、四個選項、答案
    T5：題目（念）、題目 2 （顯示句子）、答案 ----打字輸入
    T6：題目（念）、四個選項（圖片檔名）、答案（圖片檔名）
    T7：題目（念）、題目 2 （顯示句子）、四個選項、答案
  * */
  int type = 1;
  String tag = "";
  String question = ""; // 題目
  String question2 = ""; // 題目 2
  List<String> options = ["", "", "", ""];
  String answer = "";

  Problem(this.type, this.tag, this.question, this.question2, this.options,
      this.answer);

  @override
  String toString() {
    return "Problem(\n\ttype: ${type}\n\ttag: ${tag}\n\tquestion: ${question}\n\tquestion2: ${question2}\n\toption: [${options[0]} ${options[1]} ${options[2]} ${options[3]}]\n\tanswer: ${answer}\n)\n";
  }
}