import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lan_scanner/lan_scanner.dart';

class ScannerWidget extends StatefulWidget {
  const ScannerWidget({Key? key}) : super(key: key);

  @override
  State<ScannerWidget> createState() => _ScannerWidget();
}

class _ScannerWidget extends State<ScannerWidget> {
  final List<HostModel> _hosts = <HostModel>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanning network...'),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40),
                    backgroundColor: Colors.black, // Background color
                  ),
                  onPressed: () {
                    final scanner = LanScanner(debugLogging: true);

                    final stream = scanner.icmpScan(
                      '192.168.149', // change with dynamic ip
                      progressCallback: (progress) {
                        if (kDebugMode) {
                          print('progress: $progress');
                        }
                      },
                    );

                    stream.listen((HostModel host) {
                      setState(() {
                        _hosts.add(host);
                      });
                    });
                  },
                  child: const Text('Scan',
                  style: TextStyle(fontSize: 25),),
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final host = _hosts[index];

                  return Card(
                    child: ListTile(
                      title: Text(host.ip),
                    ),
                  );
                },
                itemCount: _hosts.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
