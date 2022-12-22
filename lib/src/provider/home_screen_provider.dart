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

  ///Scroll controller
  ScrollController controllerAnimalList = ScrollController();

  ///Listener for the controller pagination
  void listenControllerAllFeeds({required BuildContext context}) {
    print("pagination");
    controllerAnimalList.dispose();
    controllerAnimalList = ScrollController();
    controllerAnimalList.addListener(() {
      if (controllerAnimalList.position.maxScrollExtent ==
          controllerAnimalList.offset) {
        print("scroll");
        if (paginationList.isNotEmpty) {
          Future.delayed(const Duration(milliseconds: 1000), () {
            animalList.addAll(pagList);

            print(paginationList.length);
            pagList.clear();

            print(paginationList.length);
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
      pagList=[];

      searchList = animalList
          .where((element) => ((element.name ?? "")
              .toUpperCase()
              .contains((val).toUpperCase())))
          .toList();
      notifyListeners();
    }else{
      pagList=[];
      pagList = paginationList;
      print(paginationList.length);
      searchList=animalList;
      notifyListeners();
    }
  }

  List<Animal> adoptedAnimalList = [];

  ///This function separate adopted pets
  void onAdoptClicked(int id) {
    (searchList ?? []).firstWhere((element) => (element.id == id)).isAdopt =
        true;
    (searchList ?? []).firstWhere((element) => (element.id == id)).adoptedTime =
        DateTime.now();

    Animal adoptedAnimal = (searchList ?? []).firstWhere((element) => (element.id == id));
    adoptedAnimalList.add(adoptedAnimal);
    if (adoptedAnimalList.isNotEmpty) {
      adoptedAnimalList.sort(
          (a, b) => b.adoptedTime!.second.compareTo(a.adoptedTime!.second));

      adoptedAnimalList.forEach((element) {
        print(element.adoptedTime);
      });
    }

    notifyListeners();
  }

  ///Theme Changer Function
  bool isDark = false;
  String onThemeChange() {
    isDark = !isDark;
    notifyListeners();

    return isDark?"Dark":"Light";
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
