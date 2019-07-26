import 'package:flutter/material.dart';
import 'screens/users_screen.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UsersScreen(),
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF2D239F),
          scaffoldBackgroundColor: Color(0xFF313EBB),
        )
    );
  }
}
