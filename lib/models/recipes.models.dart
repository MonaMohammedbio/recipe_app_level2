class Recipe {
  String?docId;
  num? calories;
  String? description;
 Map<String,String>?directions;
  String? imageUrl;
  List<String>?ingredients;
  num?rate;
  num?servings;
  String?title;
  num?total_time;
  String?type;
  List<String>?favorite_user_ids;
  Recipe();
  Recipe.fromJson(Map<String, dynamic> data, [String? id]) {
    docId = id;
    calories = data['calories'];
    description = data['description'];
    directions = data['directions'] != null
        ? Map<String, String>.from(data['directions'])
        : null;
    imageUrl = data['imageUrl'];
    ingredients = data['ingredients'] != null
        ? List<String>.from(data['ingredients'].map((e) => e.toString()))
        : null;
    rate = data['rate'];
    servings = data['servings'];
    title = data['title'];
    total_time = data['total_time'];
    type = data['type'];
    favorite_user_ids=data[" favorite_user_ids"]!=null?
    List<String>.from(data[" favorite_user_ids"].map((e)=>e.toString()))
        :null;
  }

  Map<String, dynamic> toJson() {
    return {
      "calories": calories,
      "description": description,
      "directions": directions,
      "imageUrl": imageUrl,
      "ingredients": ingredients,
      "rate": rate,
      "servings": servings,
      "title": title,
      "total_time": total_time,
      "type": type,
      "favorite_user_ids":favorite_user_ids,
    };
  }
}