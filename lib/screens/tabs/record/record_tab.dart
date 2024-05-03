import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'package:permission_handler/permission_handler.dart';

class RecordTab extends StatefulWidget {
  const RecordTab({super.key});

  @override
  State<RecordTab> createState() => _RecordTabState();
}

class _RecordTabState extends State<RecordTab> {
  CameraController? controller;
  List<CameraDescription> cameras = [];
  bool isRecording = false;

  @override
  void initState() {
    super.initState();
    requestPermissions();
    initCamera();
  }

  Future<void> requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.microphone,
      Permission.storage,  // Required on Android
    ].request();
     // Log permissions status
    if (statuses[Permission.storage]?.isDenied ?? true) {
      // Open app settings if permissions are denied
      // openAppSettings();
    }
  }

  Future<void> initCamera() async {
    cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      controller = CameraController(cameras[0], ResolutionPreset.high);
      controller!.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      }).catchError((e) {

      });
    }
  }

  Future<void> capturePhoto() async {
    if (controller == null || !controller!.value.isInitialized) {
      return;
    }
  }

  Future<void> startRecording() async {
    if (controller == null || !controller!.value.isInitialized || isRecording) {
      return;
    }
    try {
      await controller!.startVideoRecording();
      setState(() {
        isRecording = true;
      });
    } catch (e) {
      throw "error";
    }
  }

  Future<void> stopAndSaveVideo() async {
    if (controller == null || !isRecording) {
      return;
    }
    try {
      setState(() {
        isRecording = false;
      });
      // Log the result of saving the video
    } catch (e) {
      throw"error";
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: controller != null && controller!.value.isInitialized
                ? CameraPreview(controller!)
                : const Center(child: CircularProgressIndicator()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: capturePhoto,
                  child: const Text('Take Photo'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: isRecording ? null : startRecording,
                  child: const Text('Start Recording'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: isRecording ? stopAndSaveVideo : null,
                  child: const Text('Stop Recording'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}