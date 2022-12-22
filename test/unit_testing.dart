import 'package:animaladopt/src/provider/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("I want to test which theme currently running", () {
    HomeScreenProvider homeScreenProvider = HomeScreenProvider();

    String result = homeScreenProvider.onThemeChange();

    expect(result, "Dark");
  });
}
