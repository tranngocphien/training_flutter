import 'package:get/get.dart';
import 'package:shopping/models/product.dart';

class CartController extends GetxController{
  RxList<Product> listProducts = <Product>[].obs;
  int get countProducts => listProducts.length;
  double get totalPrice => listProducts.fold(0, (sum, item) => sum + item.price);


  void addToCart(Product product){
    listProducts.add(product);
  }


}