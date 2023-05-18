import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:kubaby/app/config/assets.gen.dart';
import 'package:kubaby/app/config/colors.dart';
import 'package:kubaby/app/config/utils.dart';
import 'package:kubaby/app/data/product/product.dart';
import 'package:kubaby/app/modules/detailProduct/views/detail_product_view.dart';
import 'package:kubaby/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            Container(
              height: 155,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
              color: AppColors.primaryColos,
              child: Row(
                children: [
                  // Container(
                  //   height: 55,
                  //   width: 55,
                  //   decoration: BoxDecoration(
                  //       color: AppColors.appYellow, shape: BoxShape.circle),
                  //   child: const Icon(
                  //     Icons.person,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                  const SizedBox(width: 20),
                  const Expanded(
                    child: Text(
                      'Xin chào',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.settings, color: Colors.white))
                ],
              ),
            ),
            const SizedBox(height: 15),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.LIST_PRODUCT, arguments: 'Mẹ bầu');
              },
              child: const ListTile(
                title: Text(
                  'Mẹ bầu',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                trailing: Icon(Icons.keyboard_arrow_down_rounded),
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.LIST_PRODUCT, arguments: "Bé trai");
              },
              child: const ListTile(
                title: Text(
                  'Bé trai',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                trailing: Icon(Icons.keyboard_arrow_down_rounded),
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.LIST_PRODUCT, arguments: 'Bé gái');
              },
              child: const ListTile(
                title: Text(
                  'Bé gái',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                trailing: Icon(Icons.keyboard_arrow_down_rounded),
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.LIST_PRODUCT, arguments: 'Khác');
              },
              child: const ListTile(
                title: Text(
                  'Khác',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                trailing: Icon(Icons.keyboard_arrow_down_rounded),
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: Get.height / 3.3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(Assets.images.imgHomeBg.path))),
          ),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          controller.scaffoldKey.currentState?.openDrawer();
                        },
                        child: const Icon(Icons.menu)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Tìm kiếm sản phấm',
                              border: InputBorder.none,
                              suffixIcon: Container(
                                width: 55,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          AppColors.lavender,
                                          AppColors.melon,
                                          AppColors.appYellow,
                                          AppColors.appYellow,
                                        ])),
                                padding:
                                    const EdgeInsets.only(left: 0, top: 12),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: const Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 10, left: 15),
                                  child: Text('Tìm'),
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                height: 150,
                margin: const EdgeInsets.symmetric(horizontal: 19),
                decoration: BoxDecoration(
                    color: AppColors.appYellow,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(Assets.images.imgCarousel.path))),
              ),
              const SizedBox(height: 45),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                child: SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      _menuItem(
                          title: 'Mẹ bầu',
                          img: Assets.images.imgMom.path,
                          color: AppColors.melon,
                          onTap: () {
                            Get.toNamed(Routes.LIST_PRODUCT,
                                arguments: 'Mẹ bầu');
                          }),
                      const SizedBox(width: 15),
                      _menuItem(
                          title: 'Bé trai',
                          img: Assets.images.imgBabyBoy.path,
                          color: AppColors.lightBlue,
                          onTap: () {
                            Get.toNamed(
                              Routes.LIST_PRODUCT,
                              arguments: 'Bé trai',
                            );
                          }),
                      const SizedBox(width: 15),
                      _menuItem(
                          title: 'Bé gái',
                          img: Assets.images.imgBabyGirl.path,
                          color: AppColors.lavender,
                          onTap: () {
                            Get.toNamed(
                              Routes.LIST_PRODUCT,
                              arguments: 'Bé gái',
                            );
                          }),
                      const SizedBox(width: 15),
                      _menuItem(
                          title: 'Khác',
                          img: Assets.images.imgOther.path,
                          color: const Color(0xFF6FCF97),
                          onTap: () {
                            Get.toNamed(
                              Routes.LIST_PRODUCT,
                              arguments: 'Khác',
                            );
                          }),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 21),
              _trending(),
              SizedBox(
                height: 15,
              ),
              _ListProduct("Mẹ bầu"),
              SizedBox(
                height: 15,
              ),
              _ListProduct("Bé trai"),
              SizedBox(
                height: 15,
              ),
              _ListProduct("Bé gái"),

              ///todo Copy list
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuItem(
      {required String title,
      required String img,
      required Color color,
      required Function onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onTap.call();
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
                decoration: BoxDecoration(
                    color: color.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset(img),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                  color: Color(0xFF4F4F4F),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }

  Widget _trending() {
    return Container(
      height: 331,
      width: Get.width,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
          color: AppColors.melon.withOpacity(0.6),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(21), bottomLeft: Radius.circular(21))),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Sản phẩm bán chạy',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(width: 20),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.primaryColos),
                child: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 15,
                  color: Colors.white,
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
              child: Obx(() => ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    ProductModel product = controller.listProduct.value[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.DETAIL_PRODUCT, arguments: product);
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
                                        image: NetworkImage(product.image))),
                              ),
                            ),
                            Text(
                              product.name,
                              maxLines: 1,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              Utils.vndFormat(product.price),
                              maxLines: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: AppColors.primaryColos),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColos,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child: Text(
                                  'Đặt hàng',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(width: 15),
                  itemCount: controller.listProduct.value.length)))
        ],
      ),
    );
  }

  Widget _ListProduct(String title) {
    return Container(
      height: 331,
      width: Get.width,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
          color: Colors.white, //AppColors.melon.withOpacity(0.6),

          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(21), bottomLeft: Radius.circular(21))),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.LIST_PRODUCT, arguments: title);
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.primaryColos),
                  child: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Expanded(child: Obx(() {
            List<ProductModel> items = [];
            if (title == "Mẹ bầu") items = controller.listProductMebau.value;
            if (title == "Bé trai") items = controller.listProductBeTrai.value;
            if (title == "Bé gái") items = controller.listProductBegai.value;
            return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  ProductModel product = items[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.DETAIL_PRODUCT, arguments: product);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      width: Get.width / 2 - 20,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(width: 1, color: Color(0xffEEEEEE)),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(product.image))),
                            ),
                          ),
                          Text(
                            product.name,
                            maxLines: 1,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            Utils.vndFormat(product.price),
                            maxLines: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.primaryColos),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                                color: AppColors.primaryColos,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                'Đặt hàng',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(width: 15),
                itemCount: items.length);
          }))
        ],
      ),
    );
  }
}
