import 'package:e_commerce/data/home-page-data/home-page-data.dart';
import 'package:e_commerce/models/SingleProductModel.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/screens/detailscreen/detail_screen.dart';
import 'package:e_commerce/widgets/show_all_widget.dart';
import 'package:e_commerce/widgets/singleProduct_widget.dart';
import 'package:flutter/material.dart';

class CategoryAllTabBar extends StatelessWidget {
  Widget builderRender({List<SingleProductModel> singleProduct}) {
    return Container(
      height: 250,
      child: GridView.builder(
        itemCount: singleProduct.length,
        shrinkWrap: true,
        primary: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.4,
        ),
        itemBuilder: (context, index) {
          var data = singleProduct[index];
          return SingleProductWidget(
            onPressed: () {
              PageRouting.goToNextPage(
                  navigateTo: DetailScreen(data: data), context: context);
            },
            productImage: data.productImage,
            productModel: data.productModel,
            productName: data.productName,
            productOldPrice: data.productOldPrice,
            productPrice: data.productPrice,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        ShowAllWidget(
          leftText: "Clothing",
        ),
        builderRender(singleProduct: colothsData),
        ShowAllWidget(
          leftText: "Shoes",
        ),
        builderRender(
          singleProduct: shoesData,
        ),
        ShowAllWidget(
          leftText: "Accessories",
        ),
        builderRender(
          singleProduct: accessoriesData,
        ),
      ],
    );
  }
}
