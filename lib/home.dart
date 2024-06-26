import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:go_router/go_router.dart';

import 'main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final Icon title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //FlutterBlue flutterBlue = FlutterBluePlus;
  List<BluetoothDevice> devices = [];

  void startScan() async{
    await FlutterBluePlus.startScan();
    print('ça charge');
    FlutterBluePlus.scanResults.listen((results) {
      for(ScanResult result in results){
        print(result);
        if(!devices.contains(result.device)){
          setState(() {
            devices.add(result.device);
          });
        }
      }
    });
  }

  @override
  void initState() {
    startScan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: widget.title,
      ),
      body: ListView.builder(
          itemCount: devices.length,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              title: Text(devices[index].remoteId.toString()),
              subtitle: Text(devices[index].toString()),
            );
          }
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    FlutterBluePlus.stopScan();
    super.dispose();
  }
}