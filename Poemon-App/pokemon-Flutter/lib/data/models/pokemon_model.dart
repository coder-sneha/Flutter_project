class Pokemon {
  String id;
  String name;
  String image;
  String height;
  String category;
  List weakness;
  String weight;
  String gender;
  List skills;

  Pokemon(
    this.id,
    this.name,
    this.image,
    this.height,
    this.category,
    this.weakness,
    this.weight,
    this.gender,
    this.skills,
  );

  @override
  String toString() {
    return 'Pokemon{name: $name, category: $category}';
  }

  Pokemon.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image = json['image'],
        height = json['height'],
        category = json['category'],
        weakness = json['weakness'],
        weight = json['weight'],
        gender = json['gender'],
        id = json['id'],
        skills = json['skills'];

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "height": height,
        "category": category,
        "weakness": weakness,
        "weight": weight,
        "gender": gender,
        "skills": skills,
        "id": id,
      };
}
