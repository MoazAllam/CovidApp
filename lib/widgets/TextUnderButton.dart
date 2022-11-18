import 'package:flutter/material.dart';

class Text_Under_RoundedButton extends StatelessWidget {
  final String quistion;
  final String order;

  const Text_Under_RoundedButton(
      {Key? key,
      required this.quistion,
      required this.order,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          quistion,
          style:
              Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 15.0),
        ),
        Text(
          order,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
