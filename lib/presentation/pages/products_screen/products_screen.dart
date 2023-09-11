import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/custom_widgets/TopBar.dart';
import 'package:world_commerce/presentation/pages/custom_product/custom_product.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width:MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .05,
                child: const Text('Our Product',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * .75,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height * .75),
                  ),
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomProduct(
                        image: 'assets/images/iphone.png',
                        clr: const Color.fromRGBO(255, 235, 238, 1));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
