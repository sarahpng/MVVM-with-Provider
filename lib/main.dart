import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/utils/routes/routes.dart';
import 'package:mvvm_with_provider/utils/routes/routes_name.dart';
import 'package:mvvm_with_provider/view/home_screen.dart';
import 'package:mvvm_with_provider/view/login_screen.dart';

void main() {
  runApp(const MyApp());
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
      initialRoute: RoutesName.home,
      onGenerateRoute: Routes.generateRoute,
      home: const HomeScreen(),
    );
  }
}
