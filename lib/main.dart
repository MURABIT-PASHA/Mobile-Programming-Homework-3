import 'dart:async';

import 'package:flutter/material.dart';

import 'model_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final Timer _timer;
  int _counter = 0;
  String _name = "";
  int _id = 0;
  final fieldText = TextEditingController();
  ModelManager modelManager = ModelManager();

  void clearText() {
    fieldText.clear();
  }
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 50),(_){
      setState(() {

      });
    });
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Colors.white10,
              Colors.white60,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width - 20,
              height: 150,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: SizedBox(
                      width: 200,
                      height: 45,
                      child: TextField(
                        controller: fieldText,
                        onChanged: (value) {
                          setState(() {
                            _name = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Nesne adı',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                width: 1,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                width: 2,
                              )),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1,
                          )),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38,width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: RichText(
                        text: TextSpan(children: [
                          WidgetSpan(
                              child: IconButton(
                                onPressed: () {
                                  if (_counter >= 1) {
                                    setState(() {
                                      _counter--;
                                    });
                                  }
                                },
                                icon: const Icon(Icons.remove),
                              ),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text: _counter.toString(),
                              style: const TextStyle(color: Colors.black)),
                          WidgetSpan(
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _counter++;
                                  });
                                },
                                icon: const Icon(Icons.add),
                              ),
                              alignment: PlaceholderAlignment.middle),
                        ]),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: ElevatedButton(
                      onPressed: () {
                        modelManager.addModel(_counter, _name, _id, modelManager.deleteModel);
                        setState(() {
                          clearText();
                          _name = "";
                          _counter = 0;
                          _id++;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(100, 45),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black38,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: const Text("Ekle"),
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              height: 10,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width - 15,
                height: 300,
                child: ListView.builder(
                    itemCount: modelManager.getModel().length,
                    itemBuilder: (BuildContext context, int index) {
                      return modelManager.addedModels[index];
                    }),)
          ],
        ),
      ),
    );
  }
}


