class Recipe {
  final String? title;
  final String? chef;
  final String? imageUrl;
  final String? ingredients;
  final String? steps;
  final int? duration;
  final String? category;
  final String? videoUrl;
  bool? isFavorite;

  Recipe({
    this.title,
    this.chef,
    this.imageUrl,
    this.ingredients,
    this.steps,
    this.duration,
    this.category,
    this.videoUrl,
    this.isFavorite,
  });
}


// import 'dart:io';

// class RecipeModel {
//   int? id;
//   late String name;
//   // late bool isFavorite;
//   File? image;
//   late int preparationTime;
//   late String ingredients;
//   late String instructions;
//   late String chef;
//   late String videoUrl;
//   late String category;

//   RecipeModel({
//     this.id,
//     required this.name,
//     // required this.isFavorite,
//     this.image,
//     required this.preparationTime,
//     required this.ingredients,
//     required this.instructions,
//     required this.chef,
//     required this.videoUrl,
//     required this.category,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       //'isFavorite' : isFavorite ? 1 : 0,
//       'preparationTime': preparationTime,
//       'ingredients': ingredients,
//       'instructions': instructions,
//       'image': image == null ? '' : image!.path,
//       'chef': chef,
//       'url': videoUrl,
//       'category': category,
//     };
//   }

//   factory RecipeModel.fromMap(Map<String, dynamic> map) {
//     return RecipeModel(
//       id: map['id'],
//       name: map['name'],
//       //isFavorite: map['isFavorite'] == 1 ? true : false,
//       preparationTime: map['preparationTime'],
//       ingredients: map['ingredients'],
//       instructions: map['instructions'],
//       image: map['image'] != null ? File(map['image']) : null,
//       chef: map['chef'],
//       videoUrl: map['videoUrl'],
//       category: map['category'],
//     );
//   }
// }
