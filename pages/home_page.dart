import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'about_page.dart';
import 'favorites_page.dart';
import 'search_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

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
              switch (value) {
                case 'about':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage()),
                  );
                  break;
                case 'home':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                  break;
                case 'favorites':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavoritesPage()),
                  );
                  break;
                case 'search_recipe':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'about',
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('About'),
                        Icon(Icons.arrow_right),
                      ],
                    ),
                    Divider(
                      color: Colors.green,
                      thickness: 2,
                    ),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'home',
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Home'),
                        Icon(Icons.arrow_right),
                      ],
                    ),
                    Divider(
                      color: Colors.green,
                      thickness: 2,
                    ),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'favorites',
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Favorites'),
                        Icon(Icons.arrow_right),
                      ],
                    ),
                    Divider(
                      color: Colors.green,
                      thickness: 2,
                    ),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'search_recipe',
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Search Recipe'),
                        Icon(Icons.arrow_right),
                      ],
                    ),
                    Divider(
                      color: Colors.green,
                      thickness: 2,
                    ),
                  ],
                ),
              ),
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
                child: Image.asset(
                  'lib/images/hero.jpg',
                  height: 400,
                  width: 400, 
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0),

           //sign out button
            Text(user.email! + " has signed in!"),
            MaterialButton(
              onPressed: signUserOut,
              color: Colors.green,
              child: Text('SIGN OUT'),
            ),

             Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'OR',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,),
                      ),
                    ),

            // search recipe button
            MaterialButton(
              onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchPage()),
        );
      },
      color: Colors.green,
      child: Text('SEARCH INGREDIENTS'),
            )
          ],
        ),
      ),
    );
  }
}