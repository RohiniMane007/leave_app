import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'services/approute.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppRoute.router,
      // home: const Menu()

      // const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
