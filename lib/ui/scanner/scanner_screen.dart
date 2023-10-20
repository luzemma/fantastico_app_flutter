import 'package:fantastico_app/ui/scanner/barcode_camera_scanner.dart';
import 'package:fantastico_app/utils/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  BarcodeScanner? _barcodeScanner;
  bool _canProcess = true;
  bool _isBusy = false;

  bool _scannerStarted = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_scannerStarted) ...[
                BarcodeCameraScanner(
                  onSelectImage: _scannerProcessImage,
                ),
                const SizedBox(
                  height: 32,
                ),
              ],
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(ColorHelper.primaryBlue),
                ),
                onPressed: _onStartScanner,
                icon: const Icon(
                  Icons.qr_code_scanner_outlined,
                  color: Colors.white,
                ),
                label: Text(
                  '${_scannerStarted ? 'Apagar' : 'Encender'} el escáner',
                  style: textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onStartScanner() {
    _barcodeScanner ??= BarcodeScanner();
    setState(() {
      _scannerStarted = !_scannerStarted;
    });
  }

  Future<void> _scannerProcessImage(InputImage inputImage) async {
    if (!_scannerStarted || !_canProcess || _isBusy) return;

    if (_barcodeScanner == null) return;

    _isBusy = true;
    final barcodes = await _barcodeScanner!.processImage(inputImage);
    if (barcodes.isNotEmpty) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.of(context).pop(barcodes[0]);
      });
    } else {
      _isBusy = false;
    }
  }

  @override
  void dispose() {
    _canProcess = false;
    _barcodeScanner?.close();
    super.dispose();
  }
}
