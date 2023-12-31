import 'package:shopease/features/home/widgets/address_bar.dart';
import 'package:shopease/features/home/widgets/deal_of_the_day.dart';
import 'package:shopease/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/widgets/custom_app_bar.dart';
import '../../../constants/global_variables.dart';
import '../widgets/carousel_image.dart';
// import '../widgets/multi_image_offer.dart';
// import '../widgets/single_image_offer.dart';
import '../widgets/top_categories.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppBar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              user.address != '' ? const AddressBar() : const SizedBox(),
              const TopCategories(),
              const CarouselImage(),
              Container(
                decoration: const BoxDecoration(
                    gradient: GlobalVariables.goldenGradient),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DealOfTheDay(),
                      SizedBox.square(dimension: 8),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
