import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final String valueLabel;
  final String unitLabel;
  final Function() onPressedLess;
  final Function() onPressedMore;

  const InputWidget({
    super.key,
    required this.onPressedLess,
    required this.onPressedMore,
    required this.unitLabel,
    required this.valueLabel,
  });

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 400,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: IconButton(
              iconSize: 50,
              onPressed: () => widget.onPressedLess(),
              icon: Icon(Icons.remove, color: Colors.white),
              style: IconButton.styleFrom(backgroundColor: Colors.black),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.valueLabel,
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
              ),
              Text(
                widget.unitLabel,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: IconButton(
              iconSize: 50,
              onPressed: () => widget.onPressedMore(),
              icon: Icon(Icons.add, color: Colors.white),
              style: IconButton.styleFrom(backgroundColor: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
