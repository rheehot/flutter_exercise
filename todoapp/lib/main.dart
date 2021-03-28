import 'package:flutter/material.dart';
import 'package:todoapp/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Store(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
