class Animal {
  int id;
  String? name;
  double? price;
  String? age;
  String? image;
  String? location;
  bool isAdopt;
  DateTime? adoptedTime;

  Animal(
      {required this.id,
      this.name,
      this.price,
      this.age,
      this.image,
      this.location,
      this.isAdopt = false,
      this.adoptedTime});
}
