import 'package:flutter/material.dart';
import '../../resources/color_manager.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.all(12),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .7,
                  child:const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: ColorManager.grey,
                        ),
                        hintText: 'Search Product',
                        hintStyle:  TextStyle(color: ColorManager.grey),
                        filled: true,
                        fillColor: ColorManager.lightGrey,
                        border:  OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                ),
                SizedBox(width: 10,),
                CircleAvatar(
                  backgroundColor: ColorManager.lightGrey,
                  child: Icon(Icons.shopping_cart_outlined,color:ColorManager.grey),
                ),
                 SizedBox(width: 5,),
                 CircleAvatar(
                   backgroundColor: ColorManager.lightGrey,
                  child: Icon(Icons.notifications_outlined,color:ColorManager.grey),
                )
              ],
            ),
            SizedBox(height:20),
            Container(
                  width: MediaQuery.of(context).size.width,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/ppl.png'),fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
            )
          ]),
        ),
      )),
    );
  }
}
