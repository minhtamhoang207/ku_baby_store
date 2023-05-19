import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kubaby/app/data/product/product.dart';

class ListProductController extends GetxController {
  //TODO: Implement ListProductController

  Rx<List<ProductModel>> listProduct = Rx([]);
  late final GlobalKey<ScaffoldState> scaffoldKey;

  final count = 0.obs;
  var title = "".obs;
  var listtitle = [].obs;
  var listStatusTitle = [].obs;
  @override
  void onInit() async {
    scaffoldKey = GlobalKey<ScaffoldState>();
    title.value = Get.arguments as String;

    String jsonString =
        await rootBundle.loadString('assets/product_master_data.json');

    // Decode the JSON into a Dart list
    Map<String, dynamic> data = json.decode(jsonString);

    List<ProductModel> listProductResponse = (data['products'] as List)
        .map((item) => ProductModel.fromJson(item))
        .toList();
    if (title.value == "Mẹ bầu") {
      listProduct.value = listProductResponse
          .where((element) =>
              element.role == "1" ||
              element.role == "2" ||
              element.role == "3" ||
              element.role == "4" ||
              element.role == "5")
          .toList();
      listtitle.value = [
        "all",
        "Sữa cho mẹ bầu",
        "Vitamin",
        "Quần áo",
        "Máy hút sữa",
        "Túi trữ sữa"
      ];
      listStatusTitle.value = [true, false, false, false, false, false];
    }
    if (title.value == "Bé trai") {
      listProduct.value =
          listProductResponse.where((element) => element.role == "6").toList();

      // listtitle.value = [
      //   "all",
      // ];
      // listStatusTitle.value = [true];
    }
    if (title.value == "Bé gái") {
      listProduct.value =
          listProductResponse.where((element) => element.role == "7").toList();
      //  listtitle.value = [
      //     "all",
      //   ];
      //   listStatusTitle.value = [true];
    }
    if (title.value == "Khác") {
      listProduct.value =
          listProductResponse.where((element) => element.role == "8").toList();
      //  listtitle.value = [
      //     "all",
      //   ];
      //   listStatusTitle.value = [true];
    }
    if (title.value == "Tất cả") {
      listProduct.value = listProductResponse;
    }
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

  void selectTitle(String title) async {
    for (int i = 0; i < listtitle.value.length; i++) {
      if (listtitle.value[i] == title) {
        listStatusTitle.value[i] = !listStatusTitle.value[i];
        listStatusTitle.refresh();
      }
    }
    String jsonString =
        await rootBundle.loadString('assets/product_master_data.json');

    // Decode the JSON into a Dart list
    Map<String, dynamic> data = json.decode(jsonString);

    List<ProductModel> listProductResponse = (data['products'] as List)
        .map((item) => ProductModel.fromJson(item))
        .toList();
    if (listStatusTitle[0] == true) {
      listProduct.value = listProductResponse
          .where((element) =>
              element.role == "1" ||
              element.role == "2" ||
              element.role == "3" ||
              element.role == "4" ||
              element.role == "5")
          .toList();
      listProduct.refresh();
    } else {
      List<ProductModel> dataList = [];
      if (listStatusTitle[1] == true) {
        dataList.addAll(listProductResponse
            .where((element) => element.role == "1")
            .toList());
      }
      if (listStatusTitle[2] == true) {
        dataList.addAll(listProductResponse
            .where((element) => element.role == "2")
            .toList());
      }
      if (listStatusTitle[3] == true) {
        dataList.addAll(listProductResponse
            .where((element) => element.role == "3")
            .toList());
      }
      if (listStatusTitle[4] == true) {
        dataList.addAll(listProductResponse
            .where((element) => element.role == "4")
            .toList());
      }
      if (listStatusTitle[5] == true) {
        dataList.addAll(listProductResponse
            .where((element) => element.role == "5")
            .toList());
      }
      listProduct.value = dataList;
      listProduct.refresh();
    }
  }

  void increment() => count.value++;
}
