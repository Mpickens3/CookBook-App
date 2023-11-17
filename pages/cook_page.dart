import 'package:flutter/material.dart';

class CookPage extends StatelessWidget {
  final Map<String, dynamic> recipe;
  final  recipeTitle;
  final List<dynamic> instructions;

  CookPage({required this.recipe, 
  required this.recipeTitle, 
  required this.instructions,
  });

  @override
  Widget build(BuildContext context) {
    List<dynamic> ingredients = recipe['ingredients'] ?? []; // Check for null value and provide a default value

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.green,
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
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Image.network(
                      recipe['image'],
                      height: 400,
                      width: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16.0),

           Column(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text(
                  'Recipe: ${recipeTitle}', // Check for null value and provide a default value
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
             ],
           ),
            const SizedBox(height: 8.0),
            Text(
              'Ingredients:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: ingredients.length,
              itemBuilder: (BuildContext context, int index) {
                final ingredient = ingredients[index];
                return ListTile(
                  title: Text(ingredient),
                );
              },
            ),
            const SizedBox(height: 16.0),
            Text(
              'Summary:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            //Text(summary),
            const SizedBox(height: 16.0),
            Text(
              'Instructions:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: instructions.length,
                  itemBuilder: (BuildContext context, int index) {
                    final step = instructions[index];
                    final stepNumber = index + 1;
                    final stepText = step.toString();

                  return ListTile(
                    leading: Text(
                       '$stepNumber.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Text(stepText),
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
