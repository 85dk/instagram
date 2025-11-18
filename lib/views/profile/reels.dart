import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Reels extends StatelessWidget {
  const Reels({super.key});

  @override
  Widget build(BuildContext context) {
   final List<Map<String, String>> imagelist = [
  {'image': 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e', 'label': 'true',  'icon': 'false', 'viewed': '120'},
  {'image': 'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d', 'label': 'false', 'icon': 'true',  'viewed': '230'},
  {'image': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb', 'label': 'false', 'icon': 'true',  'viewed': '150'},
  {'image': 'https://images.unsplash.com/photo-1506744038136-46273834b3fb', 'label': 'false', 'icon': 'true',  'viewed': '98'},
  {'image': 'https://images.unsplash.com/photo-1500534623283-312aade485b7', 'label': 'false', 'icon': 'true',  'viewed': '310'},
  {'image': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330', 'label': 'false', 'icon': 'true',  'viewed': '50'},
  {'image': 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1', 'label': 'false', 'icon': 'true',  'viewed': '180'},
  {'image': 'https://images.unsplash.com/photo-1517841905240-472988babdf9', 'label': 'false', 'icon': 'true',  'viewed': '240'},
  {'image': 'https://images.unsplash.com/photo-1520813792240-56fc4a3765a7', 'label': 'false', 'icon': 'true',  'viewed': '500'},
  {'image': 'https://images.unsplash.com/photo-1517365830460-955ce3ccd263', 'label': 'false', 'icon': 'true',  'viewed': '75'},
];


    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                 ), 
                 itemCount: imagelist.length,
              itemBuilder: (context,index){
               final item = imagelist[index % imagelist.length];
                  return Container(
                    color: Colors.grey.shade800,
                    child: Stack(
                      children: [
                        // Image
                        Positioned.fill(
                          child: Image.network(
                            item['image']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Center text for draft
                        if (item['label'] == 'true')
                          Positioned.fill(
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                color: Colors.black54,
                                child: const Text(
                                  'Drafts',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        // Bottom overlay for viewed count
                        if (item['icon'] == 'true')
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                 const Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                 const SizedBox(width: 5),
                                  Text(
                                    item['viewed'] ?? '0',
                                    style: const TextStyle(color: Colors.white, fontSize: 14),
                                  ),
                                  
                                  
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                }
            )
            )
        ]
        )
        );
              }
            
  }

