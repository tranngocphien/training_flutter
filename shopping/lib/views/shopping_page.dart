import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/controllers/cart_controller.dart';
import 'package:shopping/controllers/products_controller.dart';

class ShoppingPage extends StatelessWidget {
  final productController = Get.put(ProductController());
  final cartController = Get.put(CartController());
  ShoppingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: GetX<ProductController>(
              builder: (controller) {
                return ListView.builder(
                    itemCount: controller.listProduct.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(8),
                        elevation: 2,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller
                                            .listProduct[index].productName,
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text(controller.listProduct[index]
                                          .productDescription)
                                    ],
                                  ),
                                  Text(
                                    controller.listProduct[index].price
                                        .toString(),
                                    style: TextStyle(fontSize: 24),
                                  )
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  cartController
                                      .addToCart(controller.listProduct[index]);
                                },
                                child: Text("ADD TO CART"),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.blue),
                              ),
                              Obx(() => IconButton(
                                icon: controller
                                    .listProduct[index].isFavorite.value
                                    ? Icon(Icons.check_box_rounded)
                                    : Icon(Icons
                                    .check_box_outline_blank_outlined),
                                onPressed: () {
                                  controller.listProduct[index].isFavorite
                                      .toggle();
                                },
                              )),
                            ],
                          ),
                        ),
                      );
                    });
              },
            )),
            GetX<CartController>(builder: (controller) {
              return Text(
                "Total amount: \$ ${controller.totalPrice}",
                style: TextStyle(fontSize: 32, color: Colors.white),
              );
            }),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton.extended(
              onPressed: (){},
              backgroundColor: Colors.yellow,
              icon: Icon(
                Icons.add_shopping_cart_rounded
              ),
              label: GetX<CartController>(
                builder: (controller) {
                  return Text(controller.countProducts.toString());
                }
              ) )
    );
  }
}
