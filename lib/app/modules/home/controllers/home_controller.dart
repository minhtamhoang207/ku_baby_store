import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kubaby/app/config/assets.gen.dart';
import 'package:kubaby/app/data/product/product.dart';

class HomeController extends GetxController {

  Rx<List<ProductModel>> listProduct = Rx([]);
  late final GlobalKey<ScaffoldState> scaffoldKey;


  @override
  void onInit() async {
    scaffoldKey = GlobalKey<ScaffoldState>();
    String jsonString = await rootBundle.loadString(
        'assets/product_master_data.json');

    // Decode the JSON into a Dart list
    Map<String, dynamic> data = json.decode(jsonString);

    List<ProductModel> listProductResponse = (data['products'] as List)
        .map((item) => ProductModel.fromJson(item))
        .toList();
    listProduct.value = listProductResponse;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


}