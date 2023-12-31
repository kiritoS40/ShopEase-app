import 'package:shopease/common/widgets/custom_app_bar.dart';
import 'package:shopease/constants/global_variables.dart';
import 'package:shopease/constants/utils.dart';
import 'package:shopease/features/account/screens/account_screen.dart';
import 'package:shopease/features/account/screens/browsing_history.dart';
import 'package:shopease/features/account/screens/wish_list_screen.dart';
import 'package:shopease/features/account/screens/your_orders.dart';
import 'package:shopease/features/cart/widgets/custom_text_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../widgets/container_clipper.dart';

class MenuScreen extends StatelessWidget {
  static const String routeName = '/menu-screen';
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60), child: CustomAppBar()),
      bottomSheet: BottomSheet(
          onClosing: () {},
          constraints: const BoxConstraints(maxHeight: 80, minHeight: 80),
          builder: ((context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextButton(
                    buttonText: 'Orders',
                    onPressed: () {
                      Navigator.pushNamed(context, YourOrders.routeName);
                    },
                    isMenuScreenButton: true),
                CustomTextButton(
                    buttonText: 'History',
                    onPressed: () {
                      Navigator.pushNamed(context, BrowsingHistory.routeName);
                    },
                    isMenuScreenButton: true),
                CustomTextButton(
                    buttonText: 'Account',
                    onPressed: () {
                      Navigator.pushNamed(context, AccountScreen.routeName);
                    },
                    isMenuScreenButton: true),
                CustomTextButton(
                    buttonText: 'Wish List',
                    onPressed: () {
                      Navigator.pushNamed(context, WishListScreen.routeName);
                    },
                    isMenuScreenButton: true),
              ],
            );
          })),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 146, 132, 227),
            Color.fromARGB(255, 169, 166, 230),
            Color.fromARGB(255, 241, 249, 252),
          ], stops: [
            0,
            0.3,
            0.7
          ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
        ),
        child: GridView.builder(
            itemCount: GlobalVariables.menuScreenImages.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
                crossAxisCount: 3),
            itemBuilder: ((context, index) {
              Map<String, String> category =
                  GlobalVariables.menuScreenImages[index];

              return MenuCategoryContainer(
                title: category['title']!,
                category: category['category']!,
                imageLink: category['image']!,
              );
              // );
            })),
      ),
    );
  }
}

class MenuCategoryContainer extends StatelessWidget {
  const MenuCategoryContainer({
    super.key,
    required this.title,
    required this.imageLink,
    required this.category,
  });

  final String title;
  final String imageLink;
  final String category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateToCategoryPage(context, category),
      child: Container(
        height: 170,
        width: 125,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade500.withOpacity(0.35),
                blurRadius: 3,
                offset: const Offset(0, 0),
                spreadRadius: 3)
          ],
          border: Border.all(color: Colors.grey.shade500, width: 1),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: ClipPath(
                clipper: ContainerClipper(),
                child: Container(
                  height: 170,
                  width: 125,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 229, 249, 254),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 4,
              left: 0,
              right: 0,
              child: CachedNetworkImage(
                imageUrl: imageLink,
                width: 120,
                height: 90,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
                left: 12,
                top: 10,
                child: SizedBox(
                  width: 100,
                  child: Text(
                    title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
