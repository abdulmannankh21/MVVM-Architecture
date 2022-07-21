import 'package:flutter/material.dart';
import 'package:mvvm/user_list/view_models/user_view_models.dart';
import 'package:provider/provider.dart';

import 'user_list/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_) => UsersViewModel()  ),
      ],
      child: MaterialApp(
        title: 'MVVM',
        home:HomeScreen(),
      ),
    );
  }
}
