// import 'dart:io';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:world_commerce/presentation/custom_widgets/form_field.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';

import '../../../repository/add_product.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController nameController = TextEditingController(text:'Nokia x');

  final TextEditingController descriptionController = TextEditingController(text:'this is description after upload');

  final TextEditingController priceController = TextEditingController(text:'100');

  final TextEditingController photosController = TextEditingController();

  final TextEditingController priceAfterDiscountController =
      TextEditingController(text:'10');

  final TextEditingController categoryController = TextEditingController(text: '64b7d9979f685a9cdff59a0b');
  final TextEditingController soldController = TextEditingController(text:'1');
  final TextEditingController subCategoryController = TextEditingController(text:"64b809c2138e0e8781b28392");

  final TextEditingController ratingAvgController = TextEditingController(text:'2');

  final TextEditingController ratingCountController = TextEditingController(text:'2');

  final TextEditingController brandController = TextEditingController(text:'64bb9e4cac77717c27d742ef');

  final TextEditingController quantityController = TextEditingController(text:'100');

  List<File> selectedImages = []; // List of selected image

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.lightGrey,
        body: ListView(
          shrinkWrap: true,
          children: [
            formField(context, 'Name', nameController,
                const Icon(Icons.add, color: ColorManager.grey)),
            formField(context, 'Description', descriptionController,
                const Icon(Icons.add, color: ColorManager.grey)),
            formField(context, 'Price', priceController,
                const Icon(Icons.add, color: ColorManager.grey)),
            formField(
                context,
                'Price After Discount',
                priceAfterDiscountController,
                const Icon(Icons.add, color: ColorManager.grey)),
            formField(context, 'Category', categoryController,
                const Icon(Icons.add, color: ColorManager.grey)),
            formField(context, 'SubCategory', subCategoryController,
                const Icon(Icons.add, color: ColorManager.grey)),
            ElevatedButton(
              onPressed: () {
                takePhoto(ImageSource.gallery);
                print('this is Images $selectedImages');
              },
              child: const Text('Upload photos'),
            ),
     
            formField(
              context,
              'Rating Avg',
              ratingAvgController,
              const Icon(Icons.add, color: ColorManager.grey),
            ),
            formField(
              context,
              'Rating Count',
              ratingCountController,
              const Icon(Icons.add, color: ColorManager.grey),
            ),
            formField(
              context,
              'Brand',
              brandController,
              const Icon(Icons.add, color: ColorManager.grey),
            ),
            formField(
              context,
              'Quantity',
              quantityController,
              const Icon(Icons.add, color: ColorManager.grey),
            ),
             formField(
              context,
              'Sold',
              soldController,
              const Icon(Icons.add, color: ColorManager.grey),
            ),
          ],
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
        
            AddProductRepo().addProduct(
                nameController.text,
                descriptionController.text,
                int.parse(priceController.text),
                int.parse(priceAfterDiscountController.text),
                int.parse(ratingAvgController.text),
                int.parse(quantityController.text),
                int.parse(ratingCountController.text),
                int.parse(soldController.text),
                categoryController.text,
                subCategoryController.text,
                brandController.text,
                selectedImages);
          },
          child: const ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
            child: BottomAppBar(
              color: ColorManager.green,
              child: Center(
                child: Text(
                  'Add Product',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final List<XFile> images = await ImagePicker().pickMultiImage();
    if (images.isNotEmpty) {
      for (int i = 0; i < images.length; i++) {
        selectedImages.add(File(images[i].path));
      }
    }
  }
}
