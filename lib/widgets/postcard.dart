import 'package:flutter/material.dart';
import 'package:instagram/widgets/highlightcircle.dart';

class PostCard extends StatelessWidget {
  final String username;
  final String profileImage;
  final String location;
  final String postImage;
  final String likes;       // existing
  final String caption;
  final String time;
  final String likesnumber;  // new
  final String commentsnum;  // new
  final Widget widget;
  //final bool repost;

  const PostCard({
    Key? key,
    required this.username,
    required this.profileImage,
    required this.location,
    required this.postImage,
    required this.likes,
    required this.caption,
    required this.time,
    required this.likesnumber,
    required this.commentsnum,
    required this.widget,
   // required this.repost,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔹 Post Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2),
          child: Row(
            children: [
              HighlightCircle(
                label: '',
                imagePath: profileImage,
                useGradientBorder: true,
                size: 40,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    if (location.isNotEmpty)
                      Text(
                        location,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                  ],
                ),
              ),
              const Icon(Icons.more_vert, size: 20),
            ],
          ),
        ),

        // 🔹 Post Image
        Image.network(
          postImage,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 300, // similar to Instagram post
        ),

        // 🔹 Action Buttons
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: Row(
            children:  [
              Icon(Icons.favorite_border, size: 26),
              const SizedBox(width: 4),
              Text(likesnumber,style: TextStyle(fontSize: 14),),
              SizedBox(width: 16),
              Icon(Icons.mode_comment_outlined, size: 26),
              const SizedBox(width: 4),
              Text(commentsnum),
              SizedBox(width: 16),
              Icon( Icons.repeat, size: 26),
              SizedBox(width: 16),
              Transform.rotate(
              angle: 335 * 3.1415926535 / 180,
           child: const Icon(
           Icons.send,
           color: Colors.black87,
         size: 26,
       ),),
              Spacer(),
              Icon(Icons.bookmark_border, size: 26),
            ],
          ),
        ),

        // 🔹 Likes & Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                 widget,
                 RichText(text:TextSpan(
                   style: const TextStyle(color: Colors.black, fontSize: 14),
                   children: [
                    const  TextSpan(text: ' Liked by '),
                     TextSpan(
                        text: username,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const TextSpan(text: ' and others '),
                   ]
                 ) ),
              // Text(
              //   likes,
              //   style: const TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 14,
              //   ),
              // ),

              ],),
            
              const SizedBox(height: 4),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  children: [
                    TextSpan(
                        text: username,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const TextSpan(text: ' '),
                    TextSpan(text: caption),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              RichText(text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 14),
                children: [
                  TextSpan(
               text: time, // Hardcoded time like Instagram
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              TextSpan(
                text: ' . See transaction',
                style: const TextStyle(color: Colors.black, fontSize: 12),
              )
                ]
              )),
             
            ],
          ),
        ),

        const SizedBox(height: 8),
        //const Divider(height: 1),
      ],
    );
  }
}
