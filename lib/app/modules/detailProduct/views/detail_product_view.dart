import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kubaby/app/config/colors.dart';
import 'package:kubaby/app/data/product/product.dart';
import 'package:intl/intl.dart';
import 'package:kubaby/app/modules/detailProduct/views/indicator.dart';
import '../controllers/detail_product_controller.dart';

class DetailProductView extends GetView<DetailProductController> {
  const DetailProductView({Key? key}) : super(key: key);
  String formatCurrency(double amount) {
    final formatCurrency = NumberFormat("#,##0", "en_US");
    return formatCurrency.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            // height: height,
            decoration: BoxDecoration(color: AppColors.primaryColos),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 400,
                          child: PageView.builder(
                              itemCount: 3,
                              onPageChanged: (index) {
                                controller.count.value = index;
                              },
                              itemBuilder: (context, index) {
                                return Obx(
                                  () => Visibility(
                                    visible:
                                        controller.productModel.value != null,
                                    child: SizedBox(
                                      height: 400,
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: CachedNetworkImage(
                                          progressIndicatorBuilder:
                                              (context, url, progress) =>
                                                  Center(
                                            child: CircularProgressIndicator(
                                              value: progress.progress,
                                            ),
                                          ),
                                          imageUrl: controller
                                              .productModel.value!.image,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        Positioned(
                          bottom: 15,
                          left: 10,
                          right: 10,
                          child: Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int index = 0; index < 3; index++)
                                  Obx(() => Indicator(
                                        isActive:
                                            controller.count.value == index
                                                ? true
                                                : false,
                                      ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() => Visibility(
                              visible: controller.productModel.value != null,
                              child: Text(
                                controller.productModel.value!.name,
                                maxLines: 2,
                                style: const TextStyle(
                                    fontSize: 21,
                                    // height: 0.4,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ))),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() => Visibility(
                                  visible:
                                      controller.productModel.value != null,
                                  child: Text(
                                    "${formatCurrency(controller.productModel.value!.price.toDouble())} đ",
                                    maxLines: 2,
                                    style: const TextStyle(
                                        fontSize: 28,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ))),
                              Container(
                                width: 42,
                                height: 42,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: const Icon(
                                  Icons.share,
                                  size: 24,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    // const SizedBox(
                    //   height: 12,
                    // ),
                    Container(
                      height: 500,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16))),
                    )
                  ]),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 50, left: 10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey[200]),
                child: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 24,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                width: width,
                height: 120,
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration: const BoxDecoration(color: Colors.white),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 62,
                    width: width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.primaryColos),
                    child: const Text(
                      "Đặt hàng",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
