import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Fliter extends StatefulWidget {
  const Fliter({super.key});

  @override
  State<Fliter> createState() => _FliterState();
}

class _FliterState extends State<Fliter> {
  ImagePicker _imagePicker=ImagePicker();
  File? _image;
  Future<void> pickimage() async {
var data=await _imagePicker.pickImage(source: ImageSource.camera);
if(data!=null){
  setState(() {
    _image= File(data.path);
  });
}
  }
   CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isRearCamera = true;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(
      _isRearCamera ? _cameras!.first : _cameras!.last,
      ResolutionPreset.high,
      enableAudio: false,
    );
    await _controller!.initialize();
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// --- CAMERA PREVIEW ---
          CameraPreview(_controller!),

          /// --- TOP BAR ---
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.close, color: Colors.white, size: 30),
                Icon(Icons.flash_off, color: Colors.white, size: 30),
                Icon(Icons.settings_rounded, color: Colors.white, size: 30),
              ],
            ),
          ),

          /// --- SIDE ICONS ---
          Positioned(
            left: 20,
            top: 150,
            child: Column(
              children: const [
                Text("Aa",style: TextStyle(color: Colors.white,fontSize: 12),),
                SizedBox(height: 25),
                Icon(Icons.loop_rounded, color: Colors.white, size: 28),
                SizedBox(height: 25),
                Icon(Icons.grid_on, color: Colors.white, size: 28),
                SizedBox(height: 25),
                Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 28),
              ],
            ),
          ),

          /// --- BOTTOM BAR ---
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Capture Button Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.image, color: Colors.white, size: 35),
                    GestureDetector(
                      onTap: () {
                        // TODO: Add capture logic later
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 5),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isRearCamera = !_isRearCamera;
                        });
                        _initCamera();
                      },
                      child: const Icon(Icons.cameraswitch, color: Colors.white, size: 35),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // Bottom Navigation (like Instagram)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Story', style: TextStyle(color: Colors.white, fontSize: 16)),
                    SizedBox(width: 20),
                    Text('Reel', style: TextStyle(color: Colors.white54, fontSize: 16)),
                    SizedBox(width: 20),
                    Text('Live', style: TextStyle(color: Colors.white54, fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 //  body: InkWell(
    //   onTap: (){pickimage();},
    //   child: Container(
    //     height: 200,
    //     width: 200,
    //     color: Colors.grey,
    //     child: _image!=null?Image.file(File(_image!.path),fit: BoxFit.cover,  ):Icon(Icons.camera),
    //   ),
    //  ),