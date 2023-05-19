import 'package:get/get.dart';
import 'package:kubaby/app/data/product/product.dart';

class DetailProductController extends GetxController {
  //TODO: Implement DetailProductController

  final count = 0.obs;
  // final Rx<ProductModel>? productModel = Rx<ProductModel>());
  Rx<ProductModel?> productModel = Rx(null);
  @override
  void onInit() {
    //var model = Get.arguments as ProductModel;
    var model = Get.arguments as ProductModel;
    // ProductModel(
    //     detail:
    //         "Sản phẩm sữa thanh trùng Dalatmilk được chế biến từ sữa bò tươi nguyên chất từ cao nguyên Lâm Đồng – nơi có nguồn nguyên liệu sữa tươi chất lượng cao được vắt từ những giống bò sữa tốt nhất trong điều kiện khí hậu trung bình từ 15 – 25oC và độ cao trên 1000m Mang đến cảm giác khác biệt của vị ngọt thanh khiết từ nguồn sữa tươi chất lượng cao",
    //     image:
    //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3K_epxurbBSJM0Bm3BDlbIACIK00LkgnKhg&usqp=CAU",
    //     name: "Dalat Milk",
    //     price: 12000,
    //     role: "1");
    productModel.value = model;
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

  void increment() => count.value++;
}
