class Ad {
  String? title;
  String? image;
  Ad();
  Ad.fromJason(Map<String,dynamic>data){
title=data["title"];
image=data["image"];

  }
  Map<String,dynamic> toJson() {
    return {
      "title": title,
      "image": image,
    };
  }
}