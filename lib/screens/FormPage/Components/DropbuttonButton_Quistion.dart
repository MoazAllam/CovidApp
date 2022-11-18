import 'package:covidapp/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DropButton_Quistion extends StatefulWidget {
  final String title;
  final List<String> items;

  const DropButton_Quistion(
      {Key? key,
      required this.title,
      required this.items,})
      : super(key: key);

  @override
  _DropButton_QuistionState createState() => _DropButton_QuistionState();
}

class _DropButton_QuistionState extends State<DropButton_Quistion> {
  var value;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20.0),
          ),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 1.5),
              decoration: BoxDecoration(
                  // color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0)),
              child: 
              Column(
                children: [
                  DropdownButton(
                    value: value,
                    isExpanded: true,
                    items: widget.items.map(buildMenu).toList(),
                    onChanged: (value) => setState(() => this.value = value),
                  ),
                  // ElevatedButton(onPressed: () => print(value), child: Text('data'))
                ],
              ),
          )
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenu(item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      );
}
