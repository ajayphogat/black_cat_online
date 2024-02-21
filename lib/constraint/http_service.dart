import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../widgets/snackBar.dart';
import 'app_exception.dart';

class HttpService {
  static serverError (error)=> showError(
      title: "Server Issue",
      description: "Unable Fetch Data with $error");
  static  networkError() => showError(
      title: "Internet Issue",
      description: "Please Check Network Connection");
  static showAlertDialog() =>showLoginWidget(
      description: "Please  Login Again"
  );
  static showAlertSuccess() =>showSuccess(
    title: "Add in Cart",
      description: "Successfully  add in cart"
  );

  //TODO
  static Future<dynamic> getRequest({required String url,}) async {
    try {
      final result = await http.get(Uri.parse(url));
      //print("Status code of $url == ${result.statusCode}");
      if (result.statusCode != 200) {
        serverError(result.statusCode);
        return null;
      }
      final parse = jsonDecode(result.body);
      //print(parse);
      return parse;
    }on SocketException{
      networkError;
      return null;
    } catch (e) {
      return null;
    }
  }
  static Future<dynamic> getWithHeaderRequest({required String url,Map<String,String>? headers}) async {
    try {
      final result = await http.get(Uri.parse(url),headers: headers);
      if (result.statusCode != 200) {
        serverError(result.statusCode);
        return null;
      }
      final parse = jsonDecode(result.body);
      //print(parse);
      return parse;
    } on SocketException {
      networkError();
      throw const SocketException('No Internet connection');
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', url);
    } on FetchDataException catch(e) {
      final String error = 'error caught: $e';
      //print(error);
      throw FetchDataException('FetchDataException', url);
    }catch (e) {
      return null;
    }
  }
  static Future<dynamic> postRequest<model>({required String url,required Map body, Map<String,String>? headers}) async {
    try {
      final result = await http.post(Uri.parse(url),body: body,headers: headers);
      if (result.statusCode != 200) {
        //print ("$url Api Status Code of ${result.statusCode}");
        serverError(result.statusCode);
        return null;
      }
      final parse = jsonDecode(result.body);
      //print("data == ${result.body}");
      return parse;
    }on SocketException{
      networkError;
      return null;
    }catch (e) {
      return null;
    }
  }



  static Future<dynamic> postJsonRequest<model>({required String url,required String body, Map<String,String>? headers}) async {
    try {
      final result = await http.post(Uri.parse(url),body: body,headers: headers);
      if (result.statusCode != 200) {
        //print ("$url Api Status Code of ${result.statusCode}");
        serverError(result.statusCode);
        return null;
      }
      // final parse = jsonDecode(result.body);
      //print("data == ${result.body}");
      return result;
    }on SocketException{
      networkError;
      return null;
    }catch (e) {
      return null;
    }
  }
/*  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        return responseJson;
        break;
      case 201:
        var responseJson = jsonDecode(response.body);
        return responseJson;
        break;
      case 400:
        throw BadRequestException(jsonDecode(response.body), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(jsonDecode(response.body), response.request!.url.toString());
      case 422:
        throw BadRequestException(jsonDecode(response.body), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException('Error occured with code : ${response.statusCode}', response.request!.url.toString());
    }
  }*/
}

