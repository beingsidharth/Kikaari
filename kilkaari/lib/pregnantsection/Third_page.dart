import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Videos'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildVideoContainer(
            title: 'Pregnancy Tips For A Healthy And Happy Pregnancy',
            imagePath: 'assets/images/video1.png',
            videoUrl:  'https://www.youtube.com/watch?v=x2sFwxX1Bzk',
          ),

          _buildVideoContainer(
            title: ' Advice for a safe and healthy pregnancy',
            imagePath: 'assets/images/video2.png',
            videoUrl:  'https://www.youtube.com/watch?v=9o_Kxcss1u8',
          ),

           _buildVideoContainer(
            title: '7 Common Pregnancy Mistakes That Increase Risk of Postnatal Complications',
            imagePath: 'assets/images/video3.png',
            videoUrl:  'https://www.youtube.com/watch?v=Z4VjfSWZJQs',
          ),

          _buildVideoContainer(
            title: 'Foods to Avoid During Pregnanacy, and WHAT TO EAT instead',
            imagePath: 'assets/images/video4.png',
            videoUrl:  'https://www.youtube.com/watch?v=lv4xrmvdamY',
          ),

          _buildVideoContainer(
            title: 'Magic Tips to open your Cervix for Normal Delivery ',
            imagePath: 'assets/images/video5.png',
            videoUrl:  'hhttps://www.youtube.com/watch?v=n2KWvIhWjmo',
          ),


          // Add other video containers similarly
        ],
      ),
    );
  }

  Widget _buildVideoContainer({
    required String title,
    required String imagePath,
    required String videoUrl,
  }) {
    return GestureDetector(
      onTap: () {
        _launchYouTubeURL(videoUrl);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200, // Adjust the height as needed
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchYouTubeURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}
}

