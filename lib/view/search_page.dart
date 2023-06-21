import 'package:flutter/material.dart';
import 'package:aplikasi_resep_masakan/file_resep.dart';
import 'package:aplikasi_resep_masakan/models/recipe_model.dart';
import 'package:aplikasi_resep_masakan/view/detail_screen.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Recipe> filteredRecipes = [];

  void _searchRecipes(String searchText) {
    if (searchText.isEmpty) {
      setState(() {
        filteredRecipes = [];
      });
    } else {
      setState(() {
        filteredRecipes = recipes.where((recipe) {
          final titleMatch =
              recipe.title!.toLowerCase().contains(searchText.toLowerCase());
          final chefMatch =
              recipe.chef!.toLowerCase().contains(searchText.toLowerCase());
          return titleMatch || chefMatch;
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  filled: true,
                  fillColor: Colors.grey[200],
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: _searchRecipes,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredRecipes.length,
              itemBuilder: (context, index) {
                final recipe = filteredRecipes[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          title: recipe.title,
                          chef: recipe.chef,
                          imgUrl: recipe.imageUrl,
                          ingredients: recipe.ingredients,
                          steps: recipe.steps,
                          duration: recipe.duration,
                          videoUrl: recipe.videoUrl,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    elevation: 4.0,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            recipe.imageUrl!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: recipe.isFavorite ?? false
                                    ? Colors.red
                                    : Colors.grey,
                                size: 25,
                              ),
                              onPressed: () {
                                setState(() {
                                  recipe.isFavorite =
                                      !(recipe.isFavorite ?? false);
                                });
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 15,
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.black54,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recipe.title!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.restaurant,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          recipe.chef!,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              color: Colors.white,
                            ),
                            height: 50,
                            width: 100,
                            child: Center(
                              child: Text(
                                '${recipe.duration} min',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
