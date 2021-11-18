import 'package:get/get.dart';
import 'package:shopping/models/product.dart';

class ProductController extends GetxController {
  var listProduct = <Product>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async{
    await Future.delayed(Duration(seconds: 5));
    var productResult = [
      Product(
          id: 1,
          price: 30,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'FirstProd'),
      Product(
          id: 2,
          price: 31,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'SecProd'),
      Product(
          id: 3,
          price: 32,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'ThirdProd'),
    ];

    listProduct.value = productResult;

  }

}