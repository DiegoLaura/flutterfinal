import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class InterpretePage extends StatefulWidget {
  @override
  _InterpretePageState createState() => _InterpretePageState();
}

class _InterpretePageState extends State<InterpretePage> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras != null && _cameras!.isNotEmpty) {
        _cameraController =
            CameraController(_cameras![0], ResolutionPreset.medium);
        await _cameraController!.initialize();
        if (mounted) {
          setState(() {});
        }
      } else {
        // Manejar el caso en que no hay cámaras disponibles
        print('No cameras available');
      }
    } catch (e) {
      // Manejar el error de inicialización aquí
      print('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Preview'),
      ),
      body: CameraPreview(_cameraController!),
    );
  }
}
