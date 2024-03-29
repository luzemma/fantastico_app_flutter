import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:fantastico_app/ui/app/widgets/custom_app_bar.dart';
import 'package:fantastico_app/ui/scanner/barcode_camera_scanner.dart';
import 'package:fantastico_app/utils/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

  static const salt = String.fromEnvironment('BARCODE_SALT');

  @override
  void initState() {
    if (salt.isEmpty) return;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const CustomAppBar(
        toolbarHeight: 100,
      ),
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
    if (barcodes.isNotEmpty && barcodes[0].rawValue != null) {
      final hashed = _getHashedBarcode(barcodes[0].rawValue!);
      Future.delayed(const Duration(milliseconds: 500), () {
        context.go(
          '/scanner/product/$hashed',
        );
        _isBusy = false;
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

  String _getHashedBarcode(String rawBarcode) {
    final hash = '\\x${md5.convert(utf8.encode('$rawBarcode$salt'))}';
    return base64.encode(hash.codeUnits);
  }
}
