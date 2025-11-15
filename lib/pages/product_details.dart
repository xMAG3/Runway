import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:runway/model/product_model.dart';
import 'package:runway/widgets/category_filter.dart';
import 'package:runway/widgets/custom_appbar.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  final String name, price, image;

  ScrollController scrollController = ScrollController();

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showBottomSheet();
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      barrierColor: Colors.transparent,
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.17,
          maxChildSize: 0.8,
          minChildSize: 0.1,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return buildBottomSheetContent(
              scrollController,
              widget.name,
              widget.price,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(
        title: 'Product Details',
        prefix: 'assets/svgs/arrow-left.svg',
        suffix: 'assets/svgs/Vector.svg',
      ),
      body: Column(
        children: [
          CategoryFilter(),

          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                SizedBox(
                  width: 240,
                  height: 600,
                  child: Image.asset(widget.image),
                ),
                Positioned(
                  left: 25,
                  right: 25,
                  bottom: 25,
                  child: Container(
                    height: 25,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.18),
                          spreadRadius: 3,
                          blurRadius: 20,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///bottom sheet content
Widget buildBottomSheetContent(
  ScrollController scroll,
  String name,
  String price,
) {
  return SingleChildScrollView(
    controller: scroll,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle
          Center(
            child: Container(
              width: 42,
              height: 6,
              decoration: BoxDecoration(
                color: Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          Gap(16),

          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),

          Gap(20),

          Row(
            children: [
              Text(
                price,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              Spacer(),
              Icon(Icons.favorite_border),
              Gap(10),
              Text(
                '450',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          Gap(20),

          // Color & Size Selector
          _buildSelector(),

          Gap(20),

          _buildAddToBagButton(),

          Gap(20),

          _buildDeliverySection(),

          Gap(20),

          Text(
            'About Product',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),

          Gap(20),

          _buildDetailsSection(),
        ],
      ),
    ),
  );
}

// ------------------- Widgets Sections ------------------- //

Widget _buildSelector() {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(width: 0.7, color: Colors.black12),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'Select Color',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 10),
            SvgPicture.asset('assets/svgs/sort.svg'),
          ],
        ),
        Container(width: 2, height: 30, color: Colors.black12),
        Row(
          children: [
            Text(
              'Select Size',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 10),
            SvgPicture.asset('assets/svgs/sort.svg'),
          ],
        ),
      ],
    ),
  );
}

Widget _buildAddToBagButton() {
  return Container(
    height: 56,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Center(
      child: Text(
        'Add to Bag',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

Widget _buildDeliverySection() {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(width: 0.7, color: Colors.black12),
    ),
    child: Column(
      children: [
        Row(
          children: [
            SizedBox(width: 10),
            SvgPicture.asset('assets/svgs/delivery.svg'),
            SizedBox(width: 10),
            Text(
              'Free delivery',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Gap(10),
        Divider(),
        Gap(10),
        Row(
          children: [
            Gap(10),
            SvgPicture.asset('assets/svgs/return.svg'),
            Gap(10),
            Text(
              'Free return',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Spacer(),
            Text(
              'View return policy',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildDetailsSection() {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(width: 0.7, color: Colors.black12),
    ),
    child: Column(
      children: [
        _buildDetailsRow('details.svg', 'Product details'),
        _divider(),
        _buildDetailsRow('solar.svg', 'Brand'),
        _divider(),
        _buildDetailsRow('measure.svg', 'Size & Fit'),
        _divider(),
        _buildDetailsRow('history.svg', 'History'),
      ],
    ),
  );
}

Widget _buildDetailsRow(String icon, String text) {
  return Row(
    children: [
      Gap(10),
      SvgPicture.asset('assets/svgs/$icon'),
      Gap(10),
      Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      Spacer(),
      Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
    ],
  );
}
//xMAG3
Widget _divider() {
  return Column(
    children: [
      Gap(5),
      Divider(color: Colors.black12),
      Gap(5),
    ],
  );
}
