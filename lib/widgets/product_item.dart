import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    this.onTap,
  });
  final String name;
  final String image;
  final String price;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 255,
            decoration: BoxDecoration(color: Color(0xffECECEC)),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Stack(
                children: [
                  Center(child: Image.asset(image)),
                  Positioned(
                    left: 60,
                    right: 60,
                    bottom: 7,
                    child: Container(
                      height: 20,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gap(10),
          Text(name, style: TextStyle(fontWeight: FontWeight.w500)),
          Gap(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(price, style: TextStyle(fontWeight: FontWeight.w600)),
              Icon(Icons.favorite_border),
            ],
          ),
        ],
      ),
    );
    ;
  }
}
