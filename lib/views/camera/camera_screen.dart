// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';
// import 'edit_screen.dart'; // 👈 Make sure this import is here

// class CameraScreen extends StatefulWidget {
//   const CameraScreen({super.key});

//   @override
//   State<CameraScreen> createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   CameraController? controller;
//   List<CameraDescription>? cameras;
//   bool isRearCamera = true;

//   @override
//   void initState() {
//     super.initState();
//     initCamera();
//   }

//   Future<void> initCamera() async {
//     cameras = await availableCameras();
//     controller = CameraController(
//       isRearCamera ? cameras!.first : cameras!.last,
//       ResolutionPreset.high,
//       enableAudio: false,
//     );
//     await controller!.initialize();
//     if (mounted) setState(() {});
//   }

//   Future<void> capturePhoto() async {
//     if (!controller!.value.isInitialized) return;
//     final directory = await getTemporaryDirectory();
//     final path = join(directory.path, "${DateTime.now().millisecondsSinceEpoch}.jpg");
//     final picture = await controller!.takePicture();
//     await picture.saveTo(path);

//     if (!mounted) return;
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => EditScreen(imagePath: path)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (controller == null || !controller!.value.isInitialized) {
//       return const Scaffold(
//         backgroundColor: Colors.black,
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           CameraPreview(controller!),

//           /// Side icons
//           Positioned(
//             right: 20,
//             top: 100,
//             child: Column(
//               children: const [
//                 Icon(Icons.flash_on, color: Colors.white, size: 30),
//                 SizedBox(height: 20),
//                 Icon(Icons.filter_alt_outlined, color: Colors.white, size: 30),
//                 SizedBox(height: 20),
//                 Icon(Icons.settings, color: Colors.white, size: 30),
//               ],
//             ),
//           ),

//           /// Capture controls
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 40),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   const Icon(Icons.image, color: Colors.white, size: 40),
//                   GestureDetector(
//                     onTap: capturePhoto,
//                     child: Container(
//                       width: 80,
//                       height: 80,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.white, width: 5),
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         isRearCamera = !isRearCamera;
//                       });
//                       initCamera();
//                     },
//                     child: const Icon(Icons.cameraswitch, color: Colors.white, size: 40),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
