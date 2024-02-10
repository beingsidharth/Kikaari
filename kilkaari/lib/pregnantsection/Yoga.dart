import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(Yoga());

class Yoga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yoga ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => CategoriesScreen(),
        '/poses': (context) => PosesScreen(),
        '/poseDetail': (context) => PoseDetailScreen(),
      },
    );
  }
}

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<dynamic> categories = [];

  @override
  void initState() {
    super.initState();
    fetchYogaCategories();
  }

  Future<void> fetchYogaCategories() async {
    final response = await http.get(Uri.parse('https://yoga-api-nzy4.onrender.com/v1/categories'));

    if (response.statusCode == 200) {
      setState(() {
        categories = json.decode(response.body);
        categories.removeWhere((category) => category['category_name'] == 'Chest Opening Yoga' || category['category_name'] == 'Backbend Yoga');
      });
    } else {
      print('Failed to fetch categories: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yoga Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return ListTile(
            leading: Icon(Icons.category), 
            title: Text(category['category_name']),
            onTap: () {
              Navigator.pushNamed(context, '/poses', arguments: category);
            },
          );
        },
      ),
    );
  }
}

class PosesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> category = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final int categoryId = category['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(category['category_name'] + ' Poses'),
      ),
      body: FutureBuilder(
        future: fetchPosesByCategory(categoryId),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<dynamic> poses = snapshot.data!;
            final pregnancyYogaPoses = [
              // List of yoga poses that are beneficial during pregnancy
              'Cat',
              'Chair',
              'Garland Pose',
              'Half Lord of the Fishes',
              'Lotus',
              'Seated Forward Bend',
              'Side Plank',
              'Side Splits',
              'Warrior One',
              'Warrior Two',
              'Warrior Three',
              'Child\'s Pose',
              'Corpse',
              'Eagle',
              'Extended Hand to Toe',
              'Half-Moon',
              'Tree',
              'Plow',
              'Shoulder Stand',
            ];
            final filteredPoses = poses.where((pose) => pregnancyYogaPoses.contains(pose['english_name'])).toList();

            return ListView.builder(
              itemCount: filteredPoses.length,
              itemBuilder: (context, index) {
                final pose = filteredPoses[index];
                return ListTile(
                  title: Text(pose['english_name']),
                  subtitle: Text(pose['sanskrit_name_adapted']),
                  leading: Image.network(pose['url_png'], width: 50, height: 50),
                  onTap: () {
                    Navigator.pushNamed(context, '/poseDetail', arguments: pose);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<dynamic>> fetchPosesByCategory(int categoryId) async {
    final response = await http.get(Uri.parse('https://yoga-api-nzy4.onrender.com/v1/categories?id=$categoryId'));

    if (response.statusCode == 200) {
      final List<dynamic> poses = json.decode(response.body)['poses'];
      return poses;
    } else {
      throw Exception('Failed to fetch poses by category: ${response.statusCode}');
    }
  }
}

class PoseDetailScreen extends StatelessWidget {
  const PoseDetailScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final dynamic pose = ModalRoute.of(context)!.settings.arguments as dynamic;

    return Scaffold(
      appBar: AppBar(
        title: Text(pose['english_name']),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(pose['url_png']),
            const SizedBox(height: 16.0),
            Text(
              'English Name: ${pose['english_name']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Sanskrit Name: ${pose['sanskrit_name_adapted']}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Description: ${pose['pose_description']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Benefits: ${pose['pose_benefits']}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
