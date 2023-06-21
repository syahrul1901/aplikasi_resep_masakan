import 'package:flutter/material.dart';
import 'package:aplikasi_resep_masakan/file_resep.dart';
import 'detail_screen.dart';
import 'package:aplikasi_resep_masakan/models/recipe_model.dart';

class FavPage extends StatefulWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavPage> {
  List<Recipe> favoriteRecipes = [];

  @override
  void initState() {
    favoriteRecipes = getFavoriteRecipes();
    super.initState();
  }

  List<Recipe> getFavoriteRecipes() {
    // Di sini, Anda perlu mengambil daftar resep favorit dari penyimpanan data Anda
    // Misalnya, jika menggunakan penyimpanan lokal, Anda dapat mengambil resep yang memiliki properti isFavorite bernilai true
    return recipes.where((recipe) => recipe.isFavorite == true).toList();
  }

  void toggleFavorite(Recipe recipe) {
    setState(() {
      if (recipe.isFavorite == null) {
        recipe.isFavorite = true;
        favoriteRecipes.add(recipe);
      } else {
        recipe.isFavorite = !recipe.isFavorite!;
        if (recipe.isFavorite!) {
          favoriteRecipes.add(recipe);
        } else {
          favoriteRecipes.remove(recipe);
        }
      }
      // Di sini, Anda juga perlu memperbarui penyimpanan data Anda sesuai dengan perubahan ini
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favoriteRecipes.isEmpty
          ? const Center(
              child: Text(
                'Tidak Ada Resep Favorite',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                final recipe = favoriteRecipes[index];
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
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 25,
                              ),
                              onPressed: () {
                                toggleFavorite(recipe);
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
    );
  }
}
