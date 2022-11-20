/*

import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';

class PrintPage extends StatefulWidget {
  final receipt;

  PrintPage(this.receipt);
  @override
  State<PrintPage> createState() => _PrintPageState();
}

class _PrintPageState extends State<PrintPage> {
  BluetoothPrint blutoothPrint = BluetoothPrint.instance;
  List<BluetoothDevice> _devices = [];
  String _devicesMsg = '';

  /*
 //new blue
  final PrinterBluetoothManager _printerManager = PrinterBluetoothManager();
  List<PrinterBluetooth> _devices = [];
  late String _devicesMsg;
*/

  @override
  void initState() {
    // print(widget.receipt.name);
    // initPrinter();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => {initPrinter()});
  }

  Future<void> initPrinter() async {
    blutoothPrint.startScan(timeout: Duration(seconds: 2));

    if (!mounted) return;
    blutoothPrint.scanResults.listen((val) {
      if (!mounted) return;
      setState(() {
        _devices = val;
      });

      if (_devices.isEmpty)
        setState(() {
          _devicesMsg = "No Devices";
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Select Printer'),
          backgroundColor: Colors.redAccent,
        ),
        body: _devices.isEmpty
            ? Center(
                child: Text(_devicesMsg ?? ""),
              )
            : ListView.builder(
                itemCount: _devices.length,
                itemBuilder: (c, i) {
                  return ListTile(
                    leading: Icon(Icons.print),
                    title: Text(_devices[i].name as String),
                    subtitle: Text(_devices[i].address as String),
                    onTap: () {
                      _startPrint(_devices[i]);
                    },
                  );
                }));
  }

  Future<void> _startPrint(BluetoothDevice device) async {
    if (device != null && device.address != null) {
      await blutoothPrint.connect(device);

      Map<String, dynamic> config = Map();
      List<LineText> list = [];

      list.add(LineText(
          type: LineText.TYPE_TEXT,
          content: "....START PRINT...",
          weight: 2,
          width: 2,
          height: 2,
          align: LineText.ALIGN_CENTER,
          linefeed: 1));

      for (var i = 0; i < widget.receipt.length; i++) {
        list.add(
          LineText(
            type: LineText.TYPE_TEXT,
            content: widget.receipt[i]['name'],
            weight: 0,
            align: LineText.ALIGN_LEFT,
            linefeed: 1,
          ),
        );
      }
    }
  }
}

      
*/
  




    /*  body: _devices.isEmpty
          ? Center(
              child: Text(_devicesMsg ?? ''),
            )
          : ListView.builder(
              itemCount: _devices.length,
              itemBuilder: (c, i) {
                return ListTile(
                  leading: const Icon(Icons.print),
                  title: Text(_devices[i].name as String),
                  subtitle: Text(_devices[i].address as String),
                  onTap: () {
                    print(_devices[i]);
                  },
                );
              },
            ),
    );
  }

  void initPrinter() {
    _printerManager.startScan(const Duration(seconds: 2));
    _printerManager.scanResults.listen((val) {
      if (!mounted) return;
      setState(() => _devices = val);
      print(_devices);
      if (_devices.isEmpty) {
        setState(() => _devicesMsg = 'No Devices');
      }

      //  print(val);
    });
  }

  Future<void> _startPrint(PrinterBluetooth printer) async {
    _printerManager.selectPrinter(printer);
    final result =
        await _printerManager.printTicket(await _ticket(PaperSize.mm80));
  }

  Future<Ticket> _ticket(PaperSize paper) async {
    final ticket = Ticket(paper);

    ticket.text('test');
    ticket.cut();
    return ticket;
  }*/







 
