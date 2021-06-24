// import 'package:camera/camera.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class cameraScreen extends StatefulWidget {
  const cameraScreen({Key? key}) : super(key: key);

  @override
  _cameraScreenState createState() => _cameraScreenState();
}

class _cameraScreenState extends State<cameraScreen> {
  late CameraController controller;
  late List cameras;
  late int selectedCameraIndx;
  late String imagePath;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    availableCameras().then((availableCameras) {
      cameras = availableCameras;
      print(cameras);
      if (cameras.length > 0) {
        setState(() {
          selectedCameraIndx = 0;
        });
        _initCameraController(cameras[selectedCameraIndx]).then((void v) {});
      } else {
        print("No available cameras");
      }
    }).catchError((err) {
      print('Error: ${err.code} \n Error Message: ${err.message}');
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller.value.isInitialized) {
      return Text("Loading");
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }

  Future _initCameraController(CameraDescription cameraDescription) async {
    // if (controller != null) {
    //   await controller.dispose();
    // }

    controller = CameraController(cameraDescription, ResolutionPreset.low);

    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }

      if (controller.value.hasError) {
        print('Camera error ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      print(e);
    }

    if (mounted) {
      setState(() {});
    }
  }
}
