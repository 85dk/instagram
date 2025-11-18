import 'package:flutter/material.dart';

class OverlappingProfileCircles extends StatelessWidget {
  final String imageUrl1;
  final String imageUrl2;
  final double size;
  final double overlap;

  const OverlappingProfileCircles({
    super.key,
    required this.imageUrl1,
    required this.imageUrl2,
    this.size = 50,
    this.overlap = 15,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size + (size - overlap),
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // First profile circle
          Positioned(
            left: 0,
            child: _buildProfileCircle(imageUrl1),
          ),

          // Second overlapping profile circle
          Positioned(
            left: size - overlap,
            child: _buildProfileCircle(imageUrl2),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCircle(String imageUrl) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.transparent,
          width: 3, // white border
        ),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
