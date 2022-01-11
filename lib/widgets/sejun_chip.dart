import 'package:flutter/material.dart';

class SejunChip extends StatelessWidget {
  const SejunChip({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Chip(
            elevation: 3,
            label: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.grey,
          ),
        ),
      );
  }
}
