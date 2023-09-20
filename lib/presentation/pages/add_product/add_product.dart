// import 'dart:io';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:world_commerce/presentation/custom_widgets/form_field.dart';
import 'package:world_commerce/presentation/resources/color_manager.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  final TextEditingController photosController = TextEditingController();

  final TextEditingController priceAfterDiscountController =
      TextEditingController();

  final TextEditingController categoryController = TextEditingController();

  final TextEditingController subCategoryController = TextEditingController();

  final TextEditingController ratingAvgController = TextEditingController();

  final TextEditingController ratingCountController = TextEditingController();

  final TextEditingController brandController = TextEditingController();

  final TextEditingController quantityController = TextEditingController();

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
               print(selectedImages);
              },
              child: const Text('Upload photos'),
            ),
            InkWell(
                onTap: () {
                  // takePhoto(ImageSource.gallery);
                },
                child: formField(
                    context,
                    'Photos',
                    photosController,
                    const Icon(Icons.camera_alt_outlined,
                        color: ColorManager.grey))),
            formField(context, 'Rating Avg', priceAfterDiscountController,
                const Icon(Icons.add, color: ColorManager.grey)),
            formField(context, 'Rating Count', categoryController,
                const Icon(Icons.add, color: ColorManager.grey)),
            formField(context, 'Brand', subCategoryController,
                const Icon(Icons.add, color: ColorManager.grey)),
            formField(context, 'Quantity', photosController,
                const Icon(Icons.add, color: ColorManager.grey)),
          ],
        ),
        bottomNavigationBar: const ClipRRect(
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
