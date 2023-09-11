import 'package:flutter/material.dart';
import 'package:world_commerce/presentation/custom_widgets/TopBar.dart';
import 'package:world_commerce/presentation/custom_widgets/form_field.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: [
            formField(context,'Name'),
            formField(context, 'Description'),
            formField(context,'Price'),
            formField(context,'Photos'),
            formField(context,'Photos'),
            formField(context,'Photos'),
            formField(context,'Photos'),
        
          ],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
          child: BottomAppBar(
            color: ColorManager.green,
            child: Center(child: Text('Add Product',style: TextStyle(fontSize: 20,color:Colors.white),),),

          ),
        ),
      ),

    );

  }
}
