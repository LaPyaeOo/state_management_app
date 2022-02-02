import 'package:flutter/material.dart';
import 'package:state_management_app/screen/register_screen.dart';
import 'package:state_management_app/screen/welcome_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
};
