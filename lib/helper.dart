import 'dart:convert';
import 'package:api/model.dart';
import 'package:http/http.dart' as http;

class APIHelper{
  APIHelper._();
  static final APIHelper apiHelper = APIHelper._();

  String API_KEY = "27279563-07ff3fccf1c4799e4158823e6";
  // String searchString = "butterfly";
  String searchString = "yellow+flowers";
  String imageType = "photo";

  Future<List<ImageModel>> fetchImagesData()async{
    String API = "https://pixabay.com/api/?key=$API_KEY&q=$searchString&image_type=$imageType&pretty=true";
    http.Response res = await http.get(Uri.parse(API));

    Map data = jsonDecode(res.body);
    List allData = data['hits'];

    List<ImageModel>response = allData.map((e) => ImageModel.fromJson(e)).toList();

    return response;
    }
  }
