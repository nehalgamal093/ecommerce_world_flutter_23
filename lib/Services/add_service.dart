import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:world_commerce/exception/loading_exception.dart';
import 'http_error_handler.dart';

class AddService {
  static String errMsg = '';
  Future<void> addService(dynamic body, String url,dynamic headers) async {
    try {
      final response = await http.post(Uri.parse(url),
          headers:headers,
          body: jsonEncode(body));
      final result = jsonDecode(utf8.decode(response.bodyBytes));
      print('===The Result is $result');
      if (response.statusCode != 200) {
        errMsg = result['error'];

        print('===Err Msg is $result');
        throw Exception(httpErrorHandler(response));
      }

      if (result.isEmpty) {
        //  print(errMsg);
        errMsg = result['error'];
        throw LoadingException('Something went wrong');
      }
      // print(result);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
