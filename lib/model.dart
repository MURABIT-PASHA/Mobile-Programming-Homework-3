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
  List<Color> colours = [];
  void getColors() {
    for (int i = 0 ; i < 20 ; i++) {
      String colorNum = "0xFF";
      for (int j = 0; j < 6; j++) {
        colorNum += Random().nextInt(9 - 1).toString();
      }
      colours.add(Color(int.parse(colorNum)));
    }
  }

  @override
  void initState() {
    super.initState();
    getColors();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 20,
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            tileColor: colours[Random().nextInt(19)],
              leading: Container(
                alignment: Alignment.center,
                height: 40,
                width: 40,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
                child: Text(widget.amount.toString()),
              ),
              trailing: Container(
                alignment: Alignment.center,
                height: 40,
                width: 40,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
                child: InkWell(
                  child: const Icon(Icons.remove),
                  onTap: () {
                    setState(() {
                      widget.function(widget.id);
                    });
                    setState(() {

                    });
                  },
                ),
              ),
              title: Text(widget.name)),
        ),
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
