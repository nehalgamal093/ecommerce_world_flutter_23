import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http_parser/http_parser.dart';
import 'package:world_commerce/Services/add_service.dart';
import 'package:http/http.dart' as http;
import 'package:world_commerce/Services/auth_service.dart';

class AddProductRepo {
  AddService addService = AddService();
  Future<dynamic> addProduct(
      String title,
      String description,
      int price,
      int priceAfterDiscount,
      int ratingAvg,
      int quantity,
      int ratingCount,
      int sold,
      String category,
      String subCategory,
      String brand,
      List<File> images) async {
    // final response = await addService.addService(<dynamic, dynamic>{
    //   'title': title,
    //   'description': description,
    //   'price': price,
    //   'priceAfterDiscount': priceAfterDiscount,
    //   'ratingAvg': ratingAvg,
    //   'quantity': quantity,
    //   'ratingCount': ratingCount,
    //   'sold': sold,
    //   'category': category,
    //   'subCategory': subCategory,
    //   'brand': brand,
    //   'images': images
    // }, dotenv.env['PRODUCT_URL']!,<String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //     'Authorization': AuthService.token
    //   },);
    // return response;
    var headers = {
      'token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoibmVoYWwiLCJ1c2VySWQiOiI2NTA0OGQ2YTliNGRjNGYzODc0YWVmMDkiLCJyb2xlIjoidXNlciIsImlhdCI6MTY5NDc5NzE4MX0.p_9SGNqfdNm-L0j8klGSF8J53kjIvdF5NtcmAG-3lrE',
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse(dotenv.env['PRODUCT_URL'].toString()));
    request.fields.addAll({
      'title': title,
      'description': description,
      'price': price.toString(),
      'priceAfterDiscount': priceAfterDiscount.toString(),
      'ratingAvg': ratingAvg.toString(),
      'quantity': quantity.toString(),
      'ratingCount': ratingCount.toString(),
      'sold': sold.toString(),
      'category': category,
      'subCategory': subCategory,
      'brand': brand
    });

    List<http.MultipartFile> newList = <http.MultipartFile>[];
    for (int i = 0; i < images.length; i++) {
      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('images', images[i].path,contentType: MediaType('image', 'jpg'));
      print('imageee patth ${images[i].path}');
      request.files.add(multipartFile);
    }
    print('newList outbody =====${newList}');
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      response.stream.transform(utf8.decoder).listen((value) {
        print('this is value $value');
      });
    } else {
      response.stream.transform(utf8.decoder).listen((value) {
        print('this is value err  $value');
      });
    }
  }
}
