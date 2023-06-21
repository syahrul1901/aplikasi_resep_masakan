import 'package:flutter/material.dart';
import 'package:aplikasi_resep_masakan/file_resep.dart';
import 'detail_screen.dart';
import 'package:aplikasi_resep_masakan/models/recipe_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = '';
  List<Recipe> filteredRecipes = [];

  @override
  void initState() {
    filterRecipesByCategory(selectedCategory);
    super.initState();
  }

  void filterRecipesByCategory(String category) {
    setState(() {
      selectedCategory = category;
      if (category.isEmpty) {
        filteredRecipes = [...recipes];
      } else {
        filteredRecipes =
            recipes.where((recipe) => recipe.category == category).toList();
      }
    });
  }

  void toggleCategory(String category) {
    setState(() {
      if (selectedCategory == category) {
        selectedCategory = '';
      } else {
        selectedCategory = category;
      }
      filterRecipesByCategory(selectedCategory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Wrap(
              spacing: 10,
              children: [
                ChoiceChip(
                  label: const Text('Hidangan Pembuka'),
                  selected: selectedCategory == 'Hidangan Pembuka',
                  onSelected: (isSelected) {
                    toggleCategory('Hidangan Pembuka');
                  },
                ),
                ChoiceChip(
                  label: const Text('Hidangan Utama'),
                  selected: selectedCategory == 'Hidangan Utama',
                  onSelected: (isSelected) {
                    toggleCategory('Hidangan Utama');
                  },
                ),
                ChoiceChip(
                  label: const Text('Hidangan Penutup'),
                  selected: selectedCategory == 'Hidangan Penutup',
                  onSelected: (isSelected) {
                    toggleCategory('Hidangan Penutup');
                  },
                ),
                ChoiceChip(
                  label: const Text('Camilan'),
                  selected: selectedCategory == 'Camilan',
                  onSelected: (isSelected) {
                    toggleCategory('Camilan');
                  },
                ),
                ChoiceChip(
                  label: const Text('Diet'),
                  selected: selectedCategory == 'Diet',
                  onSelected: (isSelected) {
                    toggleCategory('Diet');
                  },
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
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
                              InkWell(
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
                                child: Row(
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
            childCount: filteredRecipes.length,
          ),
        ),
      ],
    );
  }
}
