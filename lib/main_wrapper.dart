import 'package:aplikasi_resep_masakan/controller/main_wrapper_controller.dart';
import 'package:aplikasi_resep_masakan/view/favorite_page.dart';
import 'package:aplikasi_resep_masakan/view/home_page.dart';
import 'package:aplikasi_resep_masakan/view/search_page.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:get/get.dart';
import 'package:aplikasi_resep_masakan/view/about_us_page.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({Key? key}) : super(key: key);

  final MainWrapperController controller = Get.put(MainWrapperController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        backgroundColor: Colors.amber,
        elevation: 0,
        title: const Text(
          'Resep Masakan',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Text(
                'ResepKu',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: PageView(
        onPageChanged: controller.animateToPage,
        controller: controller.pageController,
        physics: const BouncingScrollPhysics(),
        children: const [
          HomePage(),
          SearchPage(),
          FavPage(),
          AboutUsPage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.amber,
        notchMargin: 10,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _bottomAppBarItem(
                  context,
                  icon: Icons.home,
                  page: 0,
                  label: "Home",
                ),
                _bottomAppBarItem(
                  context,
                  icon: Icons.search,
                  page: 1,
                  label: "Search",
                ),
                _bottomAppBarItem(
                  context,
                  icon: Icons.favorite,
                  page: 2,
                  label: "Favorite",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomAppBarItem(BuildContext context,
      {required icon, required page, required label}) {
    return ZoomTapAnimation(
      onTap: () => controller.goToPage(page),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: controller.currentPage.value == page
                  ? Colors.white
                  : Colors.black,
            ),
            Text(
              label,
              style: TextStyle(
                  color: controller.currentPage.value == page
                      ? Colors.white
                      : Colors.black,
                  fontSize: 13,
                  fontWeight: controller.currentPage.value == page
                      ? FontWeight.w600
                      : null),
            )
          ],
        ),
      ),
    );
  }
}
