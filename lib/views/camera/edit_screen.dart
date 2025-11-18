// // edit_screen.dart
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:photofilters/photofilters.dart';
// import 'package:image/image.dart' as img;
// import 'package:path/path.dart';



// class EditScreen extends StatefulWidget {
//   final String imagePath;
//   const EditScreen({super.key, required this.imagePath});

//   @override
//   State<EditScreen> createState() => _EditScreenState();
// }

// class _EditScreenState extends State<EditScreen> {
//   late img.Image image;
//   List<Filter> filters = presetFiltersList;
//   String? fileName;

//   @override
//   void initState() {
//     super.initState();
//     fileName = basename(widget.imagePath);
//     loadImage();
//   }

//   Future<void> loadImage() async {
//     final bytes = File(widget.imagePath).readAsBytesSync();
//     image = img.decodeImage(bytes)!;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (image == null) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('Edit Photo'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Done', style: TextStyle(color: Colors.white)),
//           )
//         ],
//       ),
//       backgroundColor: Colors.black,
//       body: Container(
//         color: Colors.black,
//         child: Column(
//           children: [
//             Expanded(
//               child: Center(child: Image.file(File(widget.imagePath))),
//             ),
//             SizedBox(
//               height: 120,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: filters.length,
//                 itemBuilder: (context, i) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: FilterThumbnailWidget(
//                       filter: filters[i],
//                       image: image,
//                       filename: fileName!,
//                       loader: Center(child: Image.file(File(widget.imagePath))),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class FilterThumbnailWidget extends StatelessWidget {
//   final Filter filter;
//   final img.Image image;
//   final String filename;
//   final Widget loader;

//   const FilterThumbnailWidget({
//     super.key,
//     required this.filter,
//     required this.image,
//     required this.filename,
//     required this.loader,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         final newImage = await applyFilter(context);
//         if (newImage != null) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Applied filter: ${filter.name}')),
//           );
//         }
//       },
//       child: Column(
//         children: [
//           Text(filter.name, style: const TextStyle(color: Colors.white, fontSize: 12)),
//           const SizedBox(height: 6),
//           Container(
//             width: 70,
//             height: 70,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: Colors.grey[900],
//             ),
//             child: loader,
//           ),
//         ],
//       ),
//     );
//   }

//   Future<img.Image?> applyFilter(BuildContext context) async {
//     return filter.apply(image);
//   }
// }