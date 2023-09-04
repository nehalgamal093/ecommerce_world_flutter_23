import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';

class CustomProduct extends StatelessWidget {
  final String image;
  final Color clr;
  const CustomProduct({super.key,required this.image,required this.clr});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          
          width: 250.0,
          height: 300,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    color: clr,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child:
                    Image.asset(image, fit: BoxFit.cover),
              ),
              SizedBox(height: 10),
              Text(
                'Iphone 2x',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 5),
              Text(
                '250 \$',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              RatingBar(
                initialRating: 2,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                glowColor: Colors.yellow,
                itemSize: 15,
                ratingWidget: RatingWidget(
                  full: Icon(Icons.star, color: Colors.yellow[500]),
                  half: Icon(Icons.star_half, color: Colors.yellow[500]),
                  empty: Icon(Icons.star_border_outlined,
                      color: Colors.yellow[500]),
                ),
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              )
            ],
          ),
        ),
        Positioned(
          top: 20,
          right:20,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.red[300],
            child: ImageIcon(AssetImage('assets/images/heart.png'),color: Colors.white,),
          ),
        )
      ],
    );
  }
}
