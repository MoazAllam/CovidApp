import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class Input_Text extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isPassword;
  final TextEditingController ctr;

  const Input_Text({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isPassword,
    required this.ctr,
  }) : super(key: key);

  @override
  State<Input_Text> createState() => _Input_TextState();
}

class _Input_TextState extends State<Input_Text> {
  @override
  void initState() {
    super.initState();
    widget.ctr.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 1.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: GoogleFonts.comfortaa(
                textStyle: TextStyle(
              color: kTextColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            )),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
              controller: widget.ctr,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is requird';
                }
                return null;
              },
              obscureText: widget.isPassword,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: kMainColor , width: 2)
                ),
                fillColor: Colors.white,
                  suffixIcon: widget.ctr.text.isEmpty
                      ? Container(
                          width: 0,
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: kMainColor,
                          ),
                          onPressed: () => widget.ctr.clear(),
                        ),
                  hintText: widget.subtitle,
                  prefixIcon: Icon(
                    widget.icon,
                    color: Color(0xff717171),
                  ),
                  hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Color(0xff474747), fontWeight: FontWeight.w300),
                  border: InputBorder.none
              ),
          ),
        ],
      ),
    );
  }
}

class Input_Text_number extends StatefulWidget {
  final String title;
  final IconData icon;
  final TextEditingController ctr;

  const Input_Text_number({
    Key? key,
    required this.title,
    required this.icon,
    required this.ctr,
  }) : super(key: key);

  @override
  State<Input_Text_number> createState() => _Input_Text_numberState();
}

class _Input_Text_numberState extends State<Input_Text_number> {
  @override
  void initState() {
    super.initState();
    widget.ctr.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 1.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: GoogleFonts.comfortaa(
                textStyle: TextStyle(
              color: kTextColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            )),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
              controller: widget.ctr,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is requird';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: kMainColor , width: 2)
                ),
                fillColor: Colors.white,
                  suffixIcon: widget.ctr.text.isEmpty
                      ? Container(
                          width: 0,
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: kMainColor,
                          ),
                          onPressed: () => widget.ctr.clear(),
                        ),
                  prefixIcon: Icon(
                    widget.icon,
                    color: Color(0xff717171),
                  ),
                  hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Color(0xff474747), fontWeight: FontWeight.w300),
                  border: InputBorder.none),
            ),
        ],
      ),
    );
  }
}
