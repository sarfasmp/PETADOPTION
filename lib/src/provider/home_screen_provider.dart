import 'package:animaladopt/src/envFile/constValues.dart';
import 'package:animaladopt/src/envFile/imageFilePath.dart';
import 'package:animaladopt/src/screens/historyScreen/history_page.dart';
import 'package:animaladopt/src/screens/homeScreen/home_page.dart';
import 'package:flutter/material.dart';

import '../models/animal_model.dart';

class HomeScreenProvider extends ChangeNotifier {
  List<Animal> animalList = [];
  List<Animal> pagList = [];

  void onValueInitializer() {
    animalList = animal;
    pagList = paginationList;
    notifyListeners();
  }

  void initialValueController({required BuildContext context}) {
    onValueInitializer();

    searchList = animalList;
    notifyListeners();
    listenControllerAllFeeds(context: context);
  }

  ///Listener for the controller pagination
  ScrollController controllerAnimalList = ScrollController();
  void listenControllerAllFeeds({required BuildContext context}) {
    controllerAnimalList.dispose();
    controllerAnimalList = ScrollController();
    controllerAnimalList.addListener(() {
      if (controllerAnimalList.position.maxScrollExtent ==
          controllerAnimalList.offset) {
        if (paginationList.isNotEmpty) {
          Future.delayed(const Duration(milliseconds: 1000), () {
            animalList.addAll(pagList);

            pagList = [];

            notifyListeners();
          });
        }
      }
    });
  }

  ///Search controller
  List<Animal>? searchList;
  TextEditingController controller = TextEditingController();
  void onTextChange(String val) {
    if (val.isNotEmpty) {
      pagList = [];
      searchList = animalList
          .where((element) => ((element.name ?? "")
              .toUpperCase()
              .contains((val).toUpperCase())))
          .toList();
      notifyListeners();
    } else {
      pagList = [];
      pagList = paginationList;
      searchList = animalList;
      notifyListeners();
    }
  }

  List<Animal> adoptedAnimalList = [];

  ///This function separate adopted pets and make chronologically ordered
  void onAdoptClicked(int id) {
    (searchList ?? []).firstWhere((element) => (element.id == id)).adoptedTime =
        DateTime.now();

    (searchList ?? []).firstWhere((element) => (element.id == id)).isAdopt =
        true;

    Animal adoptedAnimal =
        (searchList ?? []).firstWhere((element) => (element.id == id));
    adoptedAnimalList.add(adoptedAnimal);
    if (adoptedAnimalList.isNotEmpty) {
      adoptedAnimalList.sort(
          (a, b) => b.adoptedTime!.second.compareTo(a.adoptedTime!.second));
    }

    notifyListeners();
  }

  ///Theme Changer Function
  bool isDark = false;
  String onThemeChange() {
    isDark = !isDark;
    notifyListeners();

    return isDark ? "Dark" : "Light";
  }

  ///Navigation bar controller
  List screens = [
    const HomePage(),
    const HistoryScreen(),
  ];

  int currentNav = 0;
  void onNavBarChange(int val) {
    currentNav = val;
    notifyListeners();
  }
}
