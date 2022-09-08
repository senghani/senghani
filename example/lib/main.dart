import 'package:example/inc_dec_textField.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'inc dec textField',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController incDecController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.blue,
        title: const Text("IncDecTextField"),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        width: width*0.96,
        child:
          IncDecTextField(
            controller: incDecController,
            borderColor: Colors.grey,
            currency: 'Day',
            isCurrency: true,
            isNegativeRequired: true,
            textStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 16
            ),
            incIcon: const Icon(
              Icons.arrow_drop_up_outlined,
              color: Colors.black,
            ),
            decIcon: const Icon(
              Icons.arrow_drop_up_outlined,
              color: Colors.black,
            ),
          ),

      ),
    );
  }
}

