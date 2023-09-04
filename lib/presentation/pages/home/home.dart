// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/pages/custom_product/custom_product.dart';
import 'package:world_commerce/presentation/pages/product_details/product_details.dart';

import '../../resources/color_manager.dart';

class Home extends StatelessWidget {
  Home({super.key});
  List<Categories> list = [
    Categories(title: 'Electronics', icon: Icons.tv_outlined),
    Categories(title: 'Fashion', icon: Icons.ad_units),
    Categories(title: 'Home', icon: Icons.home),
    Categories(title: 'Books', icon: Icons.book),
    Categories(title: 'Beauty', icon: Icons.beach_access),
    Categories(title: 'Electronics', icon: Icons.tv_outlined),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          
          margin: const EdgeInsets.all(12),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .7,
                  child: const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: ColorManager.grey,
                        ),
                        hintText: 'Search Product',
                        hintStyle: TextStyle(color: ColorManager.grey),
                        filled: true,
                        fillColor: ColorManager.lightGrey,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundColor: ColorManager.lightGrey,
                  child: Icon(Icons.shopping_cart_outlined,
                      color: ColorManager.grey),
                ),
                SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  backgroundColor: ColorManager.lightGrey,
                  child: Icon(Icons.notifications_outlined,
                      color: ColorManager.grey),
                )
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/ppl.png'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration:const BoxDecoration(
                                color: ColorManager.lightOrange,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Icon(list[index].icon,color: ColorManager.orange,),
                          ),
                        ),
                        Text(list[index].title,style: TextStyle(fontSize: 10,color:ColorManager.grey),)
                      ],
                    );
                  }),
            ),
            const SizedBox(height:20),
            Row(
              children: [
                Text('Special for you',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
            Container(
              height: 200.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Stack(
                    children: [
                      Opacity(
                        opacity: .5,
                        
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          width: MediaQuery.of(context).size.width *.7,
                          decoration: BoxDecoration(
                                 
                              image: DecorationImage(
                                  image: AssetImage('assets/images/bannerthree.jpg',),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.all(Radius.circular(15))),
                        ),
                      ),
                      Positioned(
                        top:20,
                        left:20,
                        child: Column(
                          children: [
                            Text('Watches',style: TextStyle(fontSize: 25.0,color:Colors.black.withOpacity(.5),fontWeight:FontWeight.bold),),
                              Text('18 Brands',style: TextStyle(fontSize: 20.0,color:Colors.black.withOpacity(.5)),),
                          ],
                        ))
                    ],
                  ),
                  Stack(
                    children: [
                      Opacity(
                        opacity: .5,
                        
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          width: MediaQuery.of(context).size.width *.7,
                          decoration: BoxDecoration(
                                 
                              image: DecorationImage(
                                  image: AssetImage('assets/images/bannerone.jpg',),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.all(Radius.circular(15))),
                        ),
                      ),
                      Positioned(
                        top:20,
                        left:20,
                        child: Column(
                          children: [
                            Text('Fashio',style: TextStyle(fontSize: 25.0,color:Colors.black.withOpacity(.5),fontWeight:FontWeight.bold),),
                              Text('18 Brands',style: TextStyle(fontSize: 20.0,color:Colors.black.withOpacity(.5)),),
                          ],
                        ))
                    ],
                  ),
                  Stack(
                    children: [
                      Opacity(
                        opacity: .5,
                        
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          width: MediaQuery.of(context).size.width *.7,
                          decoration: BoxDecoration(
                                 
                              image: DecorationImage(
                                  image: AssetImage('assets/images/bannertwo.jpg',),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.all(Radius.circular(15))),
                        ),
                      ),
                      Positioned(
                        top:20,
                        left:20,
                        child: Column(
                          children: [
                            Text('Watches',style: TextStyle(fontSize: 25.0,color:Colors.black.withOpacity(.5),fontWeight:FontWeight.bold),),
                              Text('18 Brands',style: TextStyle(fontSize: 20.0,color:Colors.black.withOpacity(.5)),),
                          ],
                        ))
                    ],
                  ),
                ],
              ),
            ),
          Container(
            height:300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
            InkWell(
              onTap:(){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDetails()));
              },
              child: CustomProduct(image: 'assets/images/iphone.png',clr:const Color.fromRGBO(255, 235, 238, 1))),
              CustomProduct(image: 'assets/images/samsung.png',clr:const Color.fromRGBO(243, 229, 245, 1)),
          
          
              ],),
          )
          ]),
        ),
      )),
    );
  }
}

class Categories {
  String title;
  IconData icon;
  Categories({
    required this.title,
    required this.icon,
  });
}
