import 'package:dio/dio.dart';
import 'package:efg_network/model/Product.dart';
import 'package:efg_network/network/BaseAPI.dart';

class ProductService{


 Future<Product> getProductByID(int id) async{

   var response = await Dio().get(BaseAPI.BASE_URL+'Products/$id');

   var data=response.data;

   var product=Product.fromJson(data);

   return product;

  }


   Future<List<Product>> getAllProducts()async {


     List<Product> list=List.empty(growable: true);

     var response = await Dio().get(BaseAPI.BASE_URL+'Products/');

     var lop=response.data;

     lop.forEach((obj) {

       Product p=Product.fromJson(obj);

       list.add(p);
     });


     return list;
  }


  Future<void> uploadImage(String image)async {

   
  }



}