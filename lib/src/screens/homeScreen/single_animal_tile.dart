import 'package:animaladopt/src/models/animal_model.dart';
import 'package:flutter/material.dart';

class SingleAnimalTile extends StatelessWidget {
  int index;
  Animal animal;
  SingleAnimalTile({Key? key, required this.index, required this.animal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color:  Theme.of(context).cardColor,
      elevation: 2,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        height: 120,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(blurRadius: 2, color: Colors.grey)
                  ]),
              height: double.infinity,
              width: 120,
              child: Stack(
                children: [
                  Hero(
                    tag: index,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        animal.image ?? "",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                  animal.isAdopt ?
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow:  [
                          BoxShadow(blurRadius: 2, color: Colors.grey.withOpacity(0.6))
                        ])

                  ):SizedBox()

                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      animal.name ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline3,
                    ),

                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Text(
                          "4.5",
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(fontSize: 16, color: Colors.grey),
                        )
                      ],
                    ),

                    Row(
                      children: [
                        if (!animal.isAdopt)
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey,
                          ),
                        Text(
                          animal.isAdopt
                              ? ("Already Adopted")
                              : (animal.location ?? ""),
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(fontSize: 16, color:animal.isAdopt?Colors.red :Colors.grey),
                        )
                      ],
                    ),

                    // Text(
                    //   'Flutter card default elevation',
                    //   maxLines: 2,
                    //   overflow: TextOverflow.ellipsis,
                    //   style: Theme.of(context).textTheme.headline3,
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
