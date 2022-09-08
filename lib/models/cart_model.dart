import 'package:delivery_app/models/popular_products_,odels.dart';

class CartModels {
  int? id;
  String? name;
  int? price;
  String? img;
  String? location;
  int? typeId;
  int? quantity;
  bool? isExit;
  String? time;
  ProductsModels? product;



  CartModels(
      {this.id,
        this.name,
        this.price,
        this.img,
        this.location,
        this.typeId,
      this.quantity,
       this.isExit,
      this.time,
      this.product
      });

  CartModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    location = json['location'];
    typeId = json['type_id'];
    quantity = json['quantity'];
    isExit = json['isExit'];
    time = json['time'];
    product = ProductsModels.fromJson(json['product']);
  }
  Map<String,dynamic> toJson(){
    return{
      "id": this.id,
      "name": this.name,
      "price": this.price,
      "img": this.img,
      "quantity": this.quantity,
      "isExit": this.isExit,
      "time": this.time,
      "product":this.product!.toJson(),
    };
  }
}
