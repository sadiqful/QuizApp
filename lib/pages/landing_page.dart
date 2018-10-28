import 'package:flutter/material.dart';
import './quiz_page.dart';


class LandingPage extends StatelessWidget {

@override

Widget build(BuildContext context)
{

  return new Material(
    color: Colors.green,
    child: new InkWell(
      onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new QuizPage())),
      child: new Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
         
          new Text("Lets Quizz",style: new TextStyle(color: Colors.white,fontSize: 50.0,fontWeight: FontWeight.bold),),
          new Text("Tap to Start",style: new TextStyle(color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold),),
        ],
      ),
    ),
  );  
}
  


}
