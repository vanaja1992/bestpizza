import 'dart:convert';

PizzaModel pizzaModelFromJson(String str) =>
    PizzaModel.fromJson(json.decode(str));
String pizzaModelToJson(PizzaModel data) => json.encode(data.toJson());

class PizzaModel {
  PizzaModel({
    String? restaurant,
    String? image,
    String? address,
    List<PizzaSelections>? pizzaSelections,
  }) {
    _restaurant = restaurant;
    _image = image;
    _address = address;
    _pizzaSelections = pizzaSelections;
  }

  PizzaModel.fromJson(dynamic json) {
    _restaurant = json['restaurant'];
    _image = json['image'];
    _address = json['address'];
    if (json['pizzaSelections'] != null) {
      _pizzaSelections = [];
      json['pizzaSelections'].forEach((v) {
        _pizzaSelections?.add(PizzaSelections.fromJson(v));
      });
    }
  }
  String? _restaurant;
  String? _image;
  String? _address;
  List<PizzaSelections>? _pizzaSelections;
  PizzaModel copyWith({
    String? restaurant,
    String? image,
    String? address,
    List<PizzaSelections>? pizzaSelections,
  }) =>
      PizzaModel(
        restaurant: restaurant ?? _restaurant,
        image: image ?? _image,
        address: address ?? _address,
        pizzaSelections: pizzaSelections ?? _pizzaSelections,
      );
  String? get restaurant => _restaurant;
  String? get image => _image;
  String? get address => _address;
  List<PizzaSelections>? get pizzaSelections => _pizzaSelections;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['restaurant'] = _restaurant;
    map['image'] = _image;
    map['address'] = _address;
    if (_pizzaSelections != null) {
      map['pizzaSelections'] =
          _pizzaSelections?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

PizzaSelections pizzaSelectionsFromJson(String str) =>
    PizzaSelections.fromJson(json.decode(str));
String pizzaSelectionsToJson(PizzaSelections data) =>
    json.encode(data.toJson());

class PizzaSelections {
  PizzaSelections({
    String? name,
    String? image,
    List<Sizes>? sizes,
  }) {
    _name = name;
    _image = image;
    _sizes = sizes;
  }

  PizzaSelections.fromJson(dynamic json) {
    _name = json['name'];
    _image = json['image'];
    if (json['sizes'] != null) {
      _sizes = [];
      json['sizes'].forEach((v) {
        _sizes?.add(Sizes.fromJson(v));
      });
    }
  }
  String? _name;
  String? _image;
  List<Sizes>? _sizes;
  PizzaSelections copyWith({
    String? name,
    String? image,
    List<Sizes>? sizes,
  }) =>
      PizzaSelections(
        name: name ?? _name,
        image: image ?? _image,
        sizes: sizes ?? _sizes,
      );
  String? get name => _name;
  String? get image => _image;
  List<Sizes>? get sizes => _sizes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['image'] = _image;
    if (_sizes != null) {
      map['sizes'] = _sizes?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Sizes sizesFromJson(String str) => Sizes.fromJson(json.decode(str));
String sizesToJson(Sizes data) => json.encode(data.toJson());

class Sizes {
  Sizes({
    String? size,
    int? diameter,
    int? slicesPerPizza,
    int? sliceCalories,
  }) {
    _size = size;
    _diameter = diameter;
    _slicesPerPizza = slicesPerPizza;
    _sliceCalories = sliceCalories;
  }

  Sizes.fromJson(dynamic json) {
    _size = json['size'];
    _diameter = json['diameter'];
    _slicesPerPizza = json['slicesPerPizza'];
    _sliceCalories = json['sliceCalories'];
  }
  String? _size;
  int? _diameter;
  int? _slicesPerPizza;
  int? _sliceCalories;
  Sizes copyWith({
    String? size,
    int? diameter,
    int? slicesPerPizza,
    int? sliceCalories,
  }) =>
      Sizes(
        size: size ?? _size,
        diameter: diameter ?? _diameter,
        slicesPerPizza: slicesPerPizza ?? _slicesPerPizza,
        sliceCalories: sliceCalories ?? _sliceCalories,
      );
  String? get size => _size;
  int? get diameter => _diameter;
  int? get slicesPerPizza => _slicesPerPizza;
  int? get sliceCalories => _sliceCalories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['size'] = _size;
    map['diameter'] = _diameter;
    map['slicesPerPizza'] = _slicesPerPizza;
    map['sliceCalories'] = _sliceCalories;
    return map;
  }
}
