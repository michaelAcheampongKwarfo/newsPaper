import 'package:flutter/material.dart';
import 'package:new_paper/screens/welcome.dart';
import 'package:new_paper/widgets/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutterNewPaper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.bgColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.bgColor,
            centerTitle: true,
            elevation: 0.0,
          )),
      home: const WelcomeScreen(),
    );
  }
}
