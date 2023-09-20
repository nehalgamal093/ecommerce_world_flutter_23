import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product details'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(5),
                width: 350,
                height: 400,
                decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: const BorderRadius.all(Radius.circular(50),),),
                child: Image.asset('assets/images/iphone.png')),
          const  SizedBox(height: 50.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: 400,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius:const BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Iphone 5x pro 93847',
                          style: TextStyle(fontSize: 24),
                        ),
                        Icon(Icons.star, color: Colors.yellow)
                      ],
                    ),
                  const  Text(
                      'Iphone 5x pro 93847 Iphone 5x pro 93847 Iphone 5x pro 93847 Iphone 5x pro 93847 Iphone 5x pro 93847',
                      style: TextStyle(fontSize: 14),
                    ),
                    Row(
                      children: [
                       const Text('Available Colors: '),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 200,
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children:const [
                              CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 10,
                              ),
                              SizedBox(width: 5),
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 10,
                              ),
                              SizedBox(width: 5),
                              CircleAvatar(
                                backgroundColor: Colors.amber,
                                radius: 10,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius:const BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
        child: BottomAppBar(
          color: Colors.white,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
           const Text(
              '5000 \$',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration:const BoxDecoration(
                  color: ColorManager.lightGrey,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child:const Row(
                children: [
                  Icon(Icons.shopping_cart_outlined),
                  Text('Add To Cart'),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
