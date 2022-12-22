import 'dart:ui';

import 'package:animaladopt/src/provider/home_screen_provider.dart';
import 'package:animaladopt/src/screens/detailsScreen/single_detail_tile.dart';
import 'package:animaladopt/src/services/alert_dailoge.dart';
import 'package:animaladopt/src/services/theme_service.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/animal_model.dart';
import '../../services/snackbar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    Animal animal = args["animal"];

    final controller = ConfettiController();

    var homePro = Provider.of<HomeScreenProvider>(context);

    print(args);
    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
          //backgroundColor: Colors.purple,
          body: SafeArea(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/photoView",
                        arguments: animal.image);
                  },
                  child: Container(
                    height: size.height * 0.5,
                    child: Stack(
                      children: [
                        Hero(
                          tag: args["index"],
                          child: Image.asset(
                            animal.image ?? "",
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ),
                        Positioned(
                          top: (size.height * 0.5) - 80,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30)),
                              border:
                                  Border.all(width: 2, color: Colors.white30),
                              color: Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(0.6),
                            ),
                            height: 200,
                            width: size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    animal.name ?? "",
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        size: 18,
                                      ),
                                      Text(
                                        animal.location ?? "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            ?.copyWith(
                                              fontSize: 16,
                                            ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: const EdgeInsets.only(left: 10, top: 10),
                            padding: const EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: Colors.transparent.withOpacity(.2)),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back_ios),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SingleDetailTile(
                            title: "Age",
                            subTitle: (animal.age ?? "").toString(),
                          ),
                          SingleDetailTile(
                            title: "Price",
                            subTitle: ("₹ ${animal.price ?? ""}"),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: InkWell(
            onTap: () {
              if(!animal.isAdopt) {
                homePro.onAdoptClicked(animal.id);
                controller.play();
                showAlertDialog(
                    context: context,
                    onPressedNo: controller.stop,
                    onPressedYes: () {},
                    subtitle: "You’ve now adopted ${animal.name}");
              }
              else{
                showSnackBar(
                  context: context,
                  content: const Text("Already adopted"),
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).indicatorColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(color: Colors.grey, blurRadius: 3)
                  ]),
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 10, bottom: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Adopt Me",
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: controller,
          shouldLoop: true,
          blastDirectionality: BlastDirectionality.explosive,
        )
      ],
    );
  }
}
