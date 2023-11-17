import 'package:flutter/material.dart';

import 'cook_page.dart';

class ResultPage extends StatelessWidget {
  final List<dynamic> recipes; // Recipe data passed from the search page

  ResultPage({required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('CookBook'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu item selection
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              // Menu items
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: kToolbarHeight + 150.0,
              child: Center(
                child: Hero(
                  tag: 'hero_image',
                  child: Image.asset(
                    'lib/images/hero.jpg',
                    height: 400,
                    width: 400,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16.0),

            // recipe result display
              Expanded(
              child: ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (BuildContext context, int index) {
                  final recipe = recipes[index];
                  final title = recipe['title'];
                  final imageUrl = recipe['image'];

                  return GestureDetector(
                    onTap:() {
                      // Navigate to cook page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CookPage(
                            recipe: recipe,
                            recipeTitle: recipes[index]['title'],
                            instructions: recipes[index]['instructions'],
                            ),
                        ),
                      );
                    },
                    child: Container(
                       decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.green,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      margin: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: SizedBox(
                          width: 75.0,
                          height: 75.0,
                          child: Image.network(
                            imageUrl,
                          fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(title),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

