import 'dart:convert';

/// name : "name 16"
/// price : 27
/// description : "description 16"
/// rating : 73
/// category : "category 16"
/// available : false
/// quantity : "quantity 16"
/// photo : "http://placeimg.com/640/480/city"
/// id : "16"

Product productFromJson(String str) => Product.fromJson(json.decode(str));
String productToJson(Product data) => json.encode(data.toJson());
class Product {
  Product({
      String? name, 
      num? price, 
      String? description, 
      num? rating, 
      String? category, 
      bool? available, 
      String? quantity, 
      String? photo, 
      String? id,}){
    _name = name;
    _price = price;
    _description = description;
    _rating = rating;
    _category = category;
    _available = available;
    _quantity = quantity;
    _photo = photo;
    _id = id;
}

  Product.fromJson(dynamic json) {
    _name = json['name'];
    _price = json['price'];
    _description = json['description'];
    _rating = json['rating'];
    _category = json['category'];
    _available = json['available'];
    _quantity = json['quantity'];
    _photo = json['photo'];
    _id = json['id'];
  }
  String? _name;
  num? _price;
  String? _description;
  num? _rating;
  String? _category;
  bool? _available;
  String? _quantity;
  String? _photo;
  String? _id;
Product copyWith({  String? name,
  num? price,
  String? description,
  num? rating,
  String? category,
  bool? available,
  String? quantity,
  String? photo,
  String? id,
}) => Product(  name: name ?? _name,
  price: price ?? _price,
  description: description ?? _description,
  rating: rating ?? _rating,
  category: category ?? _category,
  available: available ?? _available,
  quantity: quantity ?? _quantity,
  photo: photo ?? _photo,
  id: id ?? _id,
);
  String? get name => _name;
  num? get price => _price;
  String? get description => _description;
  num? get rating => _rating;
  String? get category => _category;
  bool? get available => _available;
  String? get quantity => _quantity;
  String? get photo => _photo;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['price'] = _price;
    map['description'] = _description;
    map['rating'] = _rating;
    map['category'] = _category;
    map['available'] = _available;
    map['quantity'] = _quantity;
    map['photo'] = _photo;
    map['id'] = _id;
    return map;
  }

}