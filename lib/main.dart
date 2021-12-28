import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        controller.reset();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lottie Animations"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Center(
            // child: Lottie.network(
            //     'https://assets10.lottiefiles.com/packages/lf20_xlz4hb.json',
            //     animate: true,
            // ),
            child: Lottie.asset('assets/jetpack.json'),
          ),
          SizedBox(
            height: 32,
          ),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  textStyle: TextStyle(fontSize: 28)),
              onPressed: showDoneDialog,
              icon: Icon(
                Icons.delivery_dining,
                size: 42,
              ),
              label: Text('PPPack!!!')),
          SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }

  void showDoneDialog() => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset('assets/done.json',
                    repeat: false,
                    controller: controller, onLoaded: (composition) {
                  controller.duration = composition.duration;
                  controller.forward();
                }),
                Text(
                  'Mission Complete',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ));
}
