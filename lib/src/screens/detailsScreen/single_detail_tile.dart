import 'package:animaladopt/src/services/theme_service.dart';
import 'package:flutter/material.dart';

class SingleDetailTile extends StatelessWidget {
  String title;
  String subTitle;
  SingleDetailTile({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).cardColor,
          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 1)]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .headline3
                ?.copyWith(fontSize: 20, color: redColor),
          ),
          Text(subTitle,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(fontSize: 20)),
        ],
      ),
    );
  }
}
