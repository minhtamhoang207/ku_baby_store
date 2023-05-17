import 'package:get/get.dart';
import 'package:kubaby/app/modules/detailProduct/views/detail_product_view.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 1));
    Get.offNamed(Routes.DETAIL_PRODUCT);
    // Get.offNamed(Routes.DETAIL_PRODUCT);
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
