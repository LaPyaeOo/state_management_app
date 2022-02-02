import 'package:flutter/material.dart';
import 'package:state_management_app/pod/app_theme.dart';
import 'package:state_management_app/util/route_table.dart';

import 'screen/welcome_screen.dart';

void main() {
  runApp(DataManagementApp());
}

class DataManagementApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeData = AppTheme.themeData();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      initialRoute: WelcomeScreen.routeName,
      routes: appRoutes,
    );
  }
}
