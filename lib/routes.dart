// We use name route
// All our routes will be available here
import 'package:flutter/cupertino.dart';
import 'package:sing_final/screens/chat/chat_logic.dart';
import 'package:sing_final/screens/starting_screen.dart';
import 'package:sing_final/services/py_model.dart';

import 'onboarding/onboared.dart';

final Map<String, WidgetBuilder> routes = {
  OnBoardScreen.routeName: (context) => OnBoardScreen(),
  getStarted.routeName: (context) => getStarted(),
  SpeechScreen.routeName: (context) => SpeechScreen(),
  MYSignModel.routeName :(context) => MYSignModel(),
  
 
};