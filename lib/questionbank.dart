import 'package:quizapp/question.dart';

class QuizBank {
  int _questionsNumber = 0;
  final List<Question> _questionbank = [
    Question(
        q: "Internet advertising is growing at a rate of more than 30 percent a year",
        a: true),
    Question(
        q: "A business model describes how a company produces, delivers, and sells a product or serviceto create wealth",
        a: true),
    Question(
        q: "Information technology (IT) consists of all the hardware that a firm needs to use in order to achieve its business objectives, whereas information systems consist of all the software and business processes needed",
        a: false),
    Question(q: "Computers are only part of an information system", a: true),
    Question(
        q: "Information systems literacy describes the behavioral approach to information systems, whereas computer literacy describes the technical approach",
        a: false),
    Question(
        q: "Data warehouses store current and historical data from one or more sources",
        a: true),
    Question(
        q: "A network is a collection of computers that communicate with one another over transmission lines or wirelessly",
        a: true),
    Question(
        q: "Intranets use the same tools and standards as the internet, but are accessible only to a select group of users, such as employees of a company",
        a: true),
    Question(
        q: "A firewall is a hardware and/or software that guards a private network by analyzing the information leaving and entering the network",
        a: true),
    Question(
        q: "Database management systems are used to store, organize, and retrieve data",
        a: true),
    Question(
        q: "Internet advertising is growing at a rate of more than 30 percent a year",
        a: true),
    Question(
        q: "A business model describes how a company produces, delivers, and sells a product or service to create wealth",
        a: true),
    Question(
        q: "Information technology (IT) consists of all the hardware that a firm needs to use in order to achieve its business objectives, whereas information systems consist of all the software and business processes needed",
        a: false),
    Question(q: "Computers are only part of an information system", a: true),
  ];
  void nextQuestion() {
    if (_questionsNumber < _questionbank.length - 1) {
      _questionsNumber++;
    }
  }

  String getQuestionText() {
    return _questionbank[_questionsNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionbank[_questionsNumber].questionsAnswer;
  }
  bool isFinished(){
    if(_questionsNumber == _questionbank.length - 1){
      return true;
    }else{
      return false;
    }
  }
  void reset(){
    _questionsNumber = 0;
  }
}
