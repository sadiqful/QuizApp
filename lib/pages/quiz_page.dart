import 'package:flutter/material.dart';

import '../utils/quiz.dart';
import '../utils/question.dart';

import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_overlay.dart';

import './score_page.dart';



class QuizPage extends StatefulWidget {
  
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz=new Quiz([
    
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayBeVisible=false;

  @override
  void initState(){
    super.initState();
    currentQuestion=quiz.nextQuestion;
    questionText=currentQuestion.question;
    questionNumber=quiz.questionNumber;    
  }

  void handleAnswer(bool answer){

    
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
   
    this.setState((){
      overlayBeVisible=true;
    });
    
  
  }

  @override
  Widget build(BuildContext context){
    
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(  // Burasi main page alanı - here is main page
          children: <Widget>[
            new AnswerButton(true,() => handleAnswer(true)),  //true button
            new QuestionText(questionText,questionNumber),
            new AnswerButton(false,() => handleAnswer(false)), //false button
          ],
        ),
        overlayBeVisible==true ? new CorrectWrongOverlay(
          isCorrect,
          (){ 
            if(quiz.length==questionNumber)
            {
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context)=>new ScorePage(quiz.score,quiz.length)),(Route route)=> route==null);
              return; 
            
            }

            currentQuestion=quiz.nextQuestion;
            this.setState((){
              overlayBeVisible=false;
              questionText=currentQuestion.question;
              questionNumber=quiz.questionNumber;
               
            });
          }
        ) : new Container(),
      ], 
    );
  }

}



