import 'package:esc_pos_bluetooth/esc_pos_bluetooth.dart';
import 'package:flutter/material.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart';
import 'dart:io' show Platform;

class Print extends StatefulWidget {
  final receipt;

  Print(this.receipt);
  // Print({Key? key}) : super(key: key);

  @override
  State<Print> createState() => _PrintState();
}

class _PrintState extends State<Print> {
  PrinterBluetoothManager _printerManager = PrinterBluetoothManager();
  //List<PrinterBluetooth> _devices = [];
//  String _devicesMsg = '';

  @override
  void initState() {
    // print(widget.receipt.name);

    initPrinter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Printer'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Text('printer'),
      ), /*_devices.isEmpty
          ? Center(
              child: Text(_devicesMsg),
            )
          : */
      /*  ListView.builder(
        itemCount: _devices.length,
        itemBuilder: (c, i) {
          return ListTile(
            leading: const Icon(Icons.print),
            title: Text(_devices[i].name!),
            subtitle: Text(_devices[i].address!),
            onTap: () {
              print(_devices[i]);
            },
          );
        },
      ),*/
    );
  }

  void initPrinter() {
    _printerManager.startScan(const Duration(seconds: 2));
    _printerManager.scanResults.listen((val) {
      print(val);
      /*if (!mounted) return;
      setState(() => _devices = val);
      print(_devices);
      if (_devices.isEmpty) {
        setState(() => _devicesMsg = 'No Devices');
      }

      print(val);*/
    });
  } /*

  Future<void> _startPrint(PrinterBluetooth printer) async {
    _printerManager.selectPrinter(printer);
    final result = await _printerManager.printTicket(await testTicket());
  }
}

Future<List<int>> testTicket() async {
  List<int> bytes = [];
  // Using default profile
  final profile = await CapabilityProfile.load();
  final generator = Generator(PaperSize.mm80, profile);

  bytes += generator.text("Begining of receipt",
      styles: PosStyles(align: PosAlign.right));

  // add row
  bytes += generator.row([
    PosColumn(text: 'product name'),
    PosColumn(text: 'product coste'),
  ]);
  bytes += generator.feed(2);
  bytes += generator.row([
    PosColumn(text: 'product 2 name'),
    PosColumn(text: 'product 2 coste'),
  ]);
  bytes += generator.feed(2);
  bytes += generator.row([
    PosColumn(text: 'product 2 name'),
    PosColumn(text: 'product 2 coste'),
  ]);

  bytes += generator.feed(2);
  bytes += generator.cut();
  return bytes;

  */
}
