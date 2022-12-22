import 'package:animaladopt/src/provider/home_screen_provider.dart';
import 'package:animaladopt/src/screens/homeScreen/single_animal_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homePro = Provider.of<HomeScreenProvider>(context);
    Size size = MediaQuery.of(context).size;

    print(homePro.adoptedAnimalList.length);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Adopted pets",
          style: Theme.of(context).textTheme.headline3?.copyWith(fontSize: 20),),
        elevation: 0,
      ),
      body:
      homePro.adoptedAnimalList.isNotEmpty?
      ListView.separated(
        padding: const EdgeInsets.all(15),
        itemBuilder: (context, index) {
          return SingleAnimalTile(
            index: index,
            animal: homePro.searchList![index],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemCount: (homePro.adoptedAnimalList.length),
      ): Center(
        child: Text(
          "No data",style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
