// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone/utils/color_themed.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';
import 'cost_widget.dart';

class ProductInformationWidget extends StatelessWidget {
  final String productName;
  final double cost;
  final String sellerName;
  const ProductInformationWidget({
    Key? key,
    required this.productName,
    required this.cost,
    required this.sellerName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizedBox spaceThingy = const SizedBox(
      height: 7,
    );
    Size screenSize = Utils().getScreenSize();
    return SizedBox(
      width: screenSize.width / 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              productName,
              maxLines: 2,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  letterSpacing: 0.9,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
          spaceThingy,
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0),
              child: CostWidget(color: Colors.black, cost: cost),
            ),
          ),
          spaceThingy,
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Sold by ",
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
                  ),
                  TextSpan(
                    text: sellerName,
                    style:
                        const TextStyle(color: activeCyanColor, fontSize: 14),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
