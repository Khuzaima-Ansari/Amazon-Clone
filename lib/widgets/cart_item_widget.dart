// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/resources/cloudfirestore_methods.dart';
import 'package:amazon_clone/screens/product_screen.dart';
import 'package:flutter/material.dart';

import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/utils/color_themed.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/custom_square_button.dart';
import 'package:amazon_clone/widgets/product_information_widget.dart';
import 'custom_simple_rounded_button.dart';

class CartItemWidget extends StatelessWidget {
  final ProductModel product;
  const CartItemWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        height: screenSize.height / 2,
        width: screenSize.width,
        decoration: const BoxDecoration(
          color: backgroundColor,
          border: Border(
            bottom: BorderSide(color: Colors.grey, width: 1),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductScreen(productModel: product),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenSize.width / 3,
                      child: Image.network(product.url),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: ProductInformationWidget(
                          productName: product.productName,
                          cost: product.cost,
                          sellerName: product.sellerName),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  CustomSquareButton(
                    onPressed: () {},
                    color: backgroundColor,
                    dimension: 40,
                    child: const Icon(Icons.remove),
                  ),
                  CustomSquareButton(
                    onPressed: () {},
                    color: Colors.white,
                    dimension: 40,
                    child: const Text(
                      "0",
                      style: TextStyle(color: activeCyanColor),
                    ),
                  ),
                  CustomSquareButton(
                    onPressed: () async {
                      await CloudFirestoreClass().addProductToCart(
                          productModel: ProductModel(
                              url: product.uid,
                              productName: product.productName,
                              cost: product.cost,
                              discount: product.discount,
                              uid: Utils().getUid(),
                              sellerName: product.sellerName,
                              sellerUid: product.sellerUid,
                              rating: product.rating,
                              noOfRating: product.noOfRating));
                    },
                    color: backgroundColor,
                    dimension: 40,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          CustomSimpleRoundedButton(
                              onPressed: () async {
                                CloudFirestoreClass()
                                    .deleteProductFromCart(uid: product.uid);
                              },
                              text: "Delete"),
                          const SizedBox(
                            width: 5,
                          ),
                          CustomSimpleRoundedButton(
                              onPressed: () {}, text: "Save for later"),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "See more like this",
                            style:
                                TextStyle(color: activeCyanColor, fontSize: 12),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
