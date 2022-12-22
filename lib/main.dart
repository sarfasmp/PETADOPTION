import 'package:animaladopt/src/provider/home_screen_provider.dart';
import 'package:animaladopt/src/screens/detailsScreen/details_page.dart';
import 'package:animaladopt/src/screens/historyScreen/history_page.dart';
import 'package:animaladopt/src/screens/homeScreen/home_page.dart';
import 'package:animaladopt/src/screens/photoViewFlutter/photo_view.dart';
import 'package:animaladopt/src/screens/splash_screen.dart';
import 'package:animaladopt/src/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/screens/navBarControllerScreen/navBarControllerScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeScreenProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var homePro=Provider.of<HomeScreenProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeToggle.light(),
      darkTheme: ThemeToggle.dark(),
      themeMode: homePro.isDark ? ThemeMode.dark:ThemeMode.light,
      initialRoute: "/",
      routes: {
         "/": (context) => const SplashScreen(),
        "/navScreen": (context) => const NavBarController(),
        "/homeScreen": (context) => const HomePage(),
        "/detailsScreen": (context) => const DetailsScreen(),
        "/historyScreen": (context) => const HistoryScreen(),
        "/photoView":(context)=>  PhotoViewPage(),
      },
    );
  }
}

//Color redColor =  Color(#0ffcd010d);
