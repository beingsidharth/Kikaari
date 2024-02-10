/*  import 'package:flutter/material.dart';

  class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10, 
        itemBuilder: (context, index) {
          return ArticleCard(
            title: 'Article $index',
            imageUrl:
                'https://via.placeholder.com/150',
            onTapReadMore: () {
              // Implement navigation to the full article page
            },
            onSave: () {
              // Implement save functionality
            },
          );
        }, 
      ),   */


   

/* class ArticleCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback onTapReadMore;
  final VoidCallback onSave;

  const ArticleCard({
    required this.title,
    required this.imageUrl,
    required this.onTapReadMore,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              imageUrl,
              height: 170,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: onTapReadMore,
                      child: Text('Read More'),
                    ),
                    IconButton(
                      icon: Icon(Icons.bookmark_border),
                      onPressed: onSave,
                    ),
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

    );
  }
}              */

import 'package:flutter/material.dart';

void main() {
  runApp(FourthPage());
}

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pregnancy Articles',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PregnancyArticlesScreen(),
    );
  }
}

class Article {
  final String title;
  final String author;
  final String content;
  final String imageUrl; // Added imageUrl field

  Article({required this.title, required this.author, required this.content, required this.imageUrl});
}

final List<Article> pregnancyArticles = [
  Article(
    title: "The Importance of Prenatal Vitamins",
    author: "Dr. Sarah Johnson",
    content:
        "Prenatal vitamins are essential for expecting mothers as they provide crucial nutrients necessary for the development of the fetus. These vitamins include folic acid, iron, calcium, and others, which help prevent birth defects and support the overall health of both the mother and the baby. It's important for pregnant women to take prenatal vitamins regularly as part of their prenatal care regimen. However, it's also advisable to consult with a healthcare provider to determine the specific vitamins and dosages suitable for individual needs.",
    imageUrl: "https://tse3.mm.bing.net/th?id=OIP._B4CUJfebT_MErlfkftr1QHaE8&pid=Api&P=0&h=180",
  ),
  Article(
    title: "Understanding Fetal Development",
    author: "Dr. Michael Smith",
    content:
        "During pregnancy, the fetus goes through various stages of development, each of which is crucial for its growth and well-being. From the moment of conception, the fertilized egg begins to divide and form different tissues and organs. By the end of the first trimester, most of the major organs and body structures are formed, and the fetus enters the second trimester with rapid growth and development. Throughout the second and third trimesters, the fetus continues to grow and mature, with the final weeks focused on preparing for birth. Understanding fetal development helps expecting parents appreciate the complexity and beauty of the pregnancy journey.",
    imageUrl: "https://media.30seconds.com/tip_image/lg/Fetal-Development-Gallery-See-Your-Babys-Developme-4644-0ede5fd5fb-1559938226.jpg",
  ),
  Article(
    title: "Nutrition Tips for Pregnant Women",
    author: "Nutritionist Emily Brown",
    content:
        "Eating a balanced diet is crucial for the health of both the mother and the baby during pregnancy. Pregnant women should focus on consuming a variety of nutrient-rich foods, including fruits, vegetables, whole grains, lean proteins, and dairy products. It's important to pay attention to specific nutrients such as folic acid, iron, calcium, and omega-3 fatty acids, which are essential for fetal development and maternal health. Additionally, staying hydrated by drinking plenty of water is important for maintaining proper bodily functions. While cravings and aversions are common during pregnancy, it's important to strive for a well-rounded diet that meets the nutritional needs of both the mother and the growing baby.",
    imageUrl: "http://www.pngall.com/wp-content/uploads/5/Mother-With-Baby-PNG.png",
  ),

  Article(
    title: "Exercising Safely During Pregnancy",
    author: "Fitness Coach Amy Williams",
    content:
        "Regular exercise during pregnancy offers many benefits, including improved mood, reduced risk of gestational diabetes, and easier labor and delivery. However, it's essential to exercise safely and avoid activities that could harm you or your baby. Low-impact exercises like walking, swimming, and prenatal yoga are generally safe for most pregnant women. It's important to listen to your body, stay hydrated, and avoid overexertion. Always consult with your healthcare provider before starting any exercise routine during pregnancy to ensure it's safe for you and your baby.",
    imageUrl: "https://tse4.mm.bing.net/th?id=OIP.YE7gijZm4nE0pYDAiKzQ6gHaE8&pid=Api&P=0&h=180",
  ),
  Article(
    title: "Managing Pregnancy Discomforts",
    author: "Dr. Jessica Carter",
    content:
        "Pregnancy can bring about various discomforts such as nausea, back pain, and fatigue. While these discomforts are common, there are ways to manage them and improve your overall comfort during pregnancy. For nausea, try eating small, frequent meals and avoiding strong odors. Back pain can be relieved through gentle exercises, proper posture, and using supportive pillows. Fatigue is common during pregnancy, so make sure to get plenty of rest and listen to your body. If you experience severe or persistent discomforts, consult with your healthcare provider for personalized advice and treatment options.",
    imageUrl: "https://tse2.explicit.bing.net/th?id=OIP.qoiBnqnXi0aw1vZ5DBy0XQHaE8&pid=Api&P=0&h=180",
  ),

  Article(
    title: "Coping with Pregnancy Mood Swings",
    author: "Psychologist Dr. Rachel Adams",
    content: "Discussing common mood swings experienced during pregnancy and offering coping strategies to manage emotions effectively.",
    imageUrl: "https://tse2.mm.bing.net/th?id=OIP.zSDOxE66tGozityyirnJwgAAAA&pid=Api&P=0&h=180",
  ),

  Article(
    title: "The Importance of Prenatal Bonding with Your Baby",
    author: "Child Psychologist Dr. Emily Davis",
    content: "Discussing the benefits of forming a bond with the baby during pregnancy, including techniques for prenatal bonding through activities such as talking, singing, and belly rubs.",
    imageUrl: "https://tse2.mm.bing.net/th?id=OIP.96gpLBFWHgSrUspjO-wRcQHaE7&pid=Api&P=0&h=180",
  ),
  // Add more articles here with at least 7 lines of content each
];

class PregnancyArticlesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pregnancy Articles'),
      ),
      body: ListView.builder(
        itemCount: pregnancyArticles.length,
        itemBuilder: (context, index) {
          final article = pregnancyArticles[index];
          return ListTile(
            title: Text(
              article.title,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              article.author,
              style: TextStyle(fontSize: 16.0),
            ),
            leading: Image.network(
              article.imageUrl,
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleDetailsScreen(article: article),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ArticleDetailsScreen extends StatelessWidget {
  final Article article;

  ArticleDetailsScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Author: ${article.author}",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16.0),
            ),
            SizedBox(height: 16),
            Image.network(
              article.imageUrl,
              width: MediaQuery.of(context).size.width, // Full width
              height: 200.0, // Fixed height
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              article.content,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
