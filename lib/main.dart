import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user_api/services/provider/random_user.dart';
import 'package:random_user_api/ui/home/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider<RandomProvider>(
      create: (context) => RandomProvider(),
      child:const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const HomePage(),
    );
  }
}
