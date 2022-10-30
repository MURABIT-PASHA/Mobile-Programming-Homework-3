import 'dart:math';

import 'package:flutter/material.dart';

class Model extends StatefulWidget {
  final int amount;
  final String name;
  final int id;
  final Function function;
  const Model({Key? key, required this.amount, required this.name, required this.id, required this.function}) : super(key: key);

  @override
  State<Model> createState() => _ModelState();
}

class _ModelState extends State<Model> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.red,
            leading: Container(
              alignment: Alignment.center,
              height: 40,
              width: 40,
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: Text(widget.amount.toString()),
            ),
            trailing: IconButton(
              style: IconButton.styleFrom(

                  foregroundColor: Colors.black,
                  shape: const CircleBorder(
                      side: BorderSide(
                          color: Colors.black,
                          width: 2,
                          strokeAlign: StrokeAlign.outside))),
              icon: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  widget.function(widget.id);
                });
                setState(() {

                });
              },
            ),
            title: Text(widget.name)),
        const Divider(
          height: 10,
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
      ],
    );
  }
}
