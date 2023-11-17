
         import 'dart:convert';
import 'package:classico/pages/results_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String apiKey = "13880dee2bf04507982cfdff92631f6b";
  List<String> selectedIngredients = [];
  //List<String> instructions = [];

  Future<List<dynamic>> searchRecipes(List<String> ingredients) async {
    String url = "https://api.spoonacular.com/recipes/findByIngredients?apiKey=$apiKey&ingredients=${ingredients.join(",")}&number=10";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> recipes = jsonDecode(response.body);

     // handleSearchResults(recipes);

    // Fetch instructions for each recipe
    for (var recipe in recipes) {
      String recipeId = recipe['id'].toString();
      String instructionsUrl = "https://api.spoonacular.com/recipes/$recipeId/analyzedInstructions?apiKey=$apiKey";
      var instructionsResponse = await http.get(Uri.parse(instructionsUrl));
      if (instructionsResponse.statusCode == 200) {
        List<dynamic> instructions = jsonDecode(instructionsResponse.body);
        recipe['instructions'] = instructions;
      } else {
        // Failed to fetch instructions for this recipe
        recipe['instructions'] = [];
      }
    }

      return recipes;
    } else {
      throw Exception('Failed to search recipes');
    }
  }

  /*void handleSearchResults(List<dynamic> recipes) {
    instructions.clear(); // Clear the list before adding new instructions

    // Extract the instructions from each recipe and add them to the list
    for (var recipe in recipes) {
      String instruction = recipe['instructions'];
      if (instruction != null) {
        instructions.add(instruction);
      }
    }
  }*/

  void toggleIngredientSelection(String ingredient) {
    setState(() {
      if (selectedIngredients.contains(ingredient)) {
        selectedIngredients.remove(ingredient);
      } else {
        selectedIngredients.add(ingredient);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Search Ingredients'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              // Navigate to favorites page
            },
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Show navigation menu
            },
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
                child: Image.asset(
                  'lib/images/hero.jpg',
                  height: 400,
                  width: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Ingredients Below:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Protein',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Wrap(
                      spacing: 8.0,
                      children: [
                        buildIngredientChip('Chicken'),
                        buildIngredientChip('Beef'),
                        buildIngredientChip('Salmon'),
                        buildIngredientChip('Pork'),
                        buildIngredientChip('Shrimp'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Grain',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Wrap(
                      spacing: 8.0,
          children: [
            buildIngredientChip('Rice'),
            buildIngredientChip('Potatoes'),
            buildIngredientChip('Bread'),
          ],
        ),
      ],
    ),
    SizedBox(height: 16.0),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Vegetables',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Wrap(
          spacing: 8.0,
          children: [
            buildIngredientChip('Tomato'),
            buildIngredientChip('Onion'),
            buildIngredientChip('Carrot'),
          ],
        ),
      ],
    ),
    SizedBox(height: 16.0),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fruit',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Wrap(
          spacing: 8.0,
          children: [
            buildIngredientChip('Apple'),
            buildIngredientChip('Banana'),
            buildIngredientChip('Orange'),
          ],
        ),
      ],
    ),
  ],
),


            SizedBox(height: 16.0),

            // Search recipe button
              ElevatedButton(
        onPressed: () {
          // Search recipes
          if (selectedIngredients.isNotEmpty) {
            searchRecipes(selectedIngredients).then((recipes) {
              // Handle search results
              // Navigate to the results page and pass the recipes
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    recipes: recipes,
                  ),
                ),
              );
                  }).catchError((error) {
                    // Handle search error
                    print(error);
                  });
                } else {
                  // No ingredients selected, show a message or prompt
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Set the background color to green
  ),
              child: Text('Search Recipe'),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildIngredientChip(String ingredient) {
     bool isSelected = selectedIngredients.contains(ingredient);
  return ChoiceChip(
    label: Text(
      ingredient,
      style: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
      ),
    ),
    selected: isSelected,
    selectedColor: Colors.green,
    onSelected: (bool selected) {
      // Handle chip selection
      setState(() {
        if (selected) {
            selectedIngredients.add(ingredient); // Add ingredient to selected list
          } else {
            selectedIngredients.remove(ingredient); // Remove ingredient from selected list
          }
      });
    },
  );
}
}