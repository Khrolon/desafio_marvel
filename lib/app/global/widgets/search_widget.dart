// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;
  final TextStyle hintStyle;
  final TextStyle style;
  final void Function() onTap;

  const SearchWidget({
    Key? key,
    this.text = '',
    required this.onChanged,
    required this.hintText,
    this.hintStyle = const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 15,
      color: Color(0xff9D9DB6),
    ),
    this.style = const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 15,
      color: Color(0xff6A6A82),
    ),
    required this.onTap,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(231, 234, 241, 1),
        border: null,
      ),
      padding: const EdgeInsets.only(
        left: 10,
        right: 12,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: widget.hintStyle.color, size: 22),
          suffix: InkWell(
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: const Icon(
                Icons.close,
                color: Color.fromRGBO(231, 234, 241, 1),
                size: 12,
              ),
            ),
            onTap: () {
              widget.onTap();
              controller.clear();
              widget.onChanged('');
              FocusScope.of(context).requestFocus(FocusNode());
              setState(() {});
            },
          ),
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          border: InputBorder.none,
        ),
        style: widget.style,
        onChanged: widget.onChanged,
      ),
    );
  }
}
