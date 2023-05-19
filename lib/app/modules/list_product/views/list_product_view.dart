import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kubaby/app/config/colors.dart';
import 'package:kubaby/app/config/utils.dart';
import 'package:kubaby/app/data/product/product.dart';
import 'package:kubaby/app/routes/app_pages.dart';
import 'package:shimmer/shimmer.dart';
import '../controllers/list_product_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ListProductView extends GetView<ListProductController> {
  const ListProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(children: [
              Container(
                  height: 50,
                  child: Obx(() => AppBar(
                        backgroundColor: Colors.white,
                        elevation: 0.5,
                        title: Text(
                          controller.title.value,
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff4f4f4f)),
                        ),
                        leading: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_rounded,
                            size: 26,
                            color: AppColors.primaryColos,
                          ),
                        ),
                      ))),
              Obx(() {
                if (controller.listtitle.length == 0) return Container();
                return Container(
                    height: 70,
                    color: Color(0xffFFDBDA),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Obx(() => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.listtitle.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Obx(() {
                              return GestureDetector(
                                onTap: () {
                                  controller
                                      .selectTitle(controller.listtitle[index]);
                                },
                                child: Container(
                                  height: 15,
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color:
                                          controller.listStatusTitle[index] ==
                                                  false
                                              ? Colors.white
                                              : AppColors.primaryColos,
                                      borderRadius: BorderRadius.circular(26)),
                                  child: Obx(() => Text(
                                        controller.listtitle[index],
                                        style: TextStyle(
                                            color: controller.listStatusTitle[
                                                        index] ==
                                                    false
                                                ? Colors.grey
                                                : Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      )),
                                ),
                              );
                            });
                          },
                        )));
              }),
              Expanded(
                child: Container(
                  color: const Color(0xffFFDBDA),
                  padding: const EdgeInsets.all(10),
                  child: Obx(() => GridView.builder(
                        // physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          crossAxisCount: 2,
                        ),
                        itemCount: controller.listProduct.value.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Obx(() {
                            ProductModel item =
                                controller.listProduct.value[index];
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_PRODUCT,
                                    arguments: item);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                width: Get.width / 2 - 20,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(item.image)),
                                      ),
                                    )),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      item.name,
                                      maxLines: 1,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      Utils.vndFormat(item.price),
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: AppColors.primaryColos),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      height: 48,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      decoration: BoxDecoration(
                                          color: AppColors.primaryColos,
                                          borderRadius:
                                              BorderRadius.circular(14)),
                                      child: const Center(
                                        child: Text(
                                          'Đặt hàng',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                        },
                      )),
                ),
              )
            ]),
          ),
        ));
  }
}
