import 'package:animaladopt/src/provider/home_screen_provider.dart';
import 'package:animaladopt/src/screens/homeScreen/single_animal_tile.dart';
import 'package:animaladopt/src/screens/homeScreen/textField.dart';
import 'package:animaladopt/src/services/snackbar.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homePro.initialValueController(context: context);
    });
  }

  late HomeScreenProvider homePro;

  @override
  Widget build(BuildContext context) {
    homePro = Provider.of<HomeScreenProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Pets",
            style:
                Theme.of(context).textTheme.headline3?.copyWith(fontSize: 24)),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                homePro.onThemeChange();
              },
              icon: Icon(
                Icons.color_lens,
                color: Theme.of(context).indicatorColor,
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).shadowColor, blurRadius: 5),
                ],
              ),
              height: 55,
              width: size.width,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: commonTextField(
                      key: const Key("textField"),
                        context: context,
                        hint: "Search",
                        controller: homePro.controller,
                        onChanged: (val) {
                          homePro.onTextChange(val);
                        },
                        icon: Icon(
                          Icons.search,
                          color: Theme.of(context).indicatorColor,
                        )),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              controller: homePro.controllerAnimalList,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                if (index < (homePro.searchList?.length ?? 0)) {
                  return InkWell(
                      onTap: () {
                        if (!(homePro.searchList?[index].isAdopt ?? false)) {
                          Navigator.pushNamed(
                            context,
                            "/detailsScreen",
                            arguments: {
                              "index": index,
                              "animal": homePro.searchList![index]
                            },
                          );
                        }else{
                          showSnackBar(
                            context: context,
                            content: const Text("Already adopted"),
                          );
                        }
                      },
                      child: SingleAnimalTile(
                        index: index,
                        animal: homePro.searchList![index],
                      ));
                } else {
                  if (homePro.pagList.isNotEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const SizedBox();
                  }
                }
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
                );
              },
              itemCount: (homePro.animalList.length + 1),
            ),
          ),
        ],
      ),
    );
  }
}
