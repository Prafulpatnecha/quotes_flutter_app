import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qoutes_application/view/favorite/bookmark/favorite_page.dart';
import 'package:qoutes_application/view/favorite/category/category_page.dart';
import 'package:qoutes_application/view/home/home_page.dart';

import '../view/category/category_main_page.dart';
import '../view/favorite/category/category_solve/category_solve_page.dart';
import '../view/save/save_any_place.dart';
import '../view/theme/themePage.dart';
import '../view/veiw_screen/view_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/view',
      getPages: [
        GetPage(name: "/", page: () => const HomePage(),transition: Transition.circularReveal),
        GetPage(name: "/theme", page: () => const ThemePage(),transition: Transition.circularReveal),
        GetPage(name: "/book_filter", page: () => const CategoryPage(),transition: Transition.circularReveal),
        GetPage(name: "/book_show", page: () => const FavoritePage(),transition: Transition.circularReveal),
        GetPage(name: "/show", page: () => const SaveAnyPlace(),transition: Transition.circularReveal),
        GetPage(name: "/view", page: () => const SplashPage(),transition: Transition.circularReveal),
        GetPage(name: "/category", page: () => const CategoryMainPage(),transition: Transition.circularReveal),
        GetPage(name: "/category_quote", page: () => const CategorySolvePage(),transition: Transition.circularReveal),
      ],
    );
  }
}
