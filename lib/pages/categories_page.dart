import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:runway/model/product_model.dart';
import 'package:runway/pages/product_details.dart';

import 'package:runway/widgets/category_filter.dart';
import 'package:runway/widgets/custom_appbar.dart';
import 'package:runway/widgets/product_item.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});

  List<ProductModel> products = [
    ProductModel(
      name: 'Gray coat and white T-shirt',
      image: 'assets/images/models/image 3.png',
      price: '\$30',
    ),
    ProductModel(
      name: 'Gray coat and white T-shirt',
      image: 'assets/images/models/image 2.png',
      price: '\$30',
    ),
    ProductModel(
      name: 'Gray coat and white T-shirt',
      image: 'assets/images/models/image 1.png',
      price: '\$50',
    ),
    ProductModel(
      name: 'Top man black with Trous..',
      image: 'assets/images/models/image 3.png',
      price: '\$30',
    ),
    ProductModel(
      name: 'Gray coat and white T-shirt',
      image: 'assets/images/models/image 2.png',
      price: '\$25',
    ),
    ProductModel(
      name: 'Gray coat and white T-shirt',
      image: 'assets/images/models/image 6.png',
      price: '\$100',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(
        title: 'Men',
        prefix: 'assets/svgs/arrow-left.svg',
        suffix: 'assets/svgs/Vector.svg',
        onTap: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          CategoryFilter(),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (contex, index) {
                  final product = products[index];
                  return ProductItem(
                    name: product.name,
                    image: product.image,
                    price: product.price,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (c) => ProductDetails(
                            name: product.name,
                            price: product.price,
                            image: product.image,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
