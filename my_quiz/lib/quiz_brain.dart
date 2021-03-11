import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionBank = [
    new Question('Some cats are actually allergic to humans', true),
    new Question('You can lead a cow down stairs but not up stairs.', false),
    new Question('Approximately one quarter of human bones are in the feet.', true),
    new Question('A slug\'s blood is green.', true),
    new Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    new Question('It is illegal to pee in the Ocean in Portugal.', true),
    new Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    new Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    new Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    new Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    new Question('Google was originally called \"Backrub\".', true),
    new Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    new Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
        _questionNumber++;
    }
  }

  void resetQuestionNumber() {
    _questionNumber = 0;
  }

  bool isLastQuestionReached() {
    print('questionNumber $_questionNumber');
    print('questionBank ${_questionBank.length}');
    return _questionNumber >= _questionBank.length - 1;
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }
}
