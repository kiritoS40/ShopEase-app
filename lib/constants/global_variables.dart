import 'package:flutter/material.dart';
import 'dart:collection';

String uri = 'http://192.168.254.109:3000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 146, 132, 227),
      Color.fromARGB(255, 166, 186, 230),
    ],
    // stops: [0.5, 1.0],
  );
  static const addressBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 182, 199, 239),
      Color.fromARGB(255, 203, 235, 241),
    ],
    stops: [0.5, 1.0],
  );

  static const goldenGradient = LinearGradient(
      colors: [Color(0xffFFEDBB), Color(0xffFEDC71)], stops: [0.25, 1]);

  static const secondaryColor = Color.fromARGB(255, 166, 186, 230);
  static const purpleColor = Color.fromARGB(255, 146, 132, 227);
  static const backgroundColor = Colors.white;
  static const greenColor = Colors.deepPurple;
  static const redColor = Color(0xffB22603);
  static const Color greyBackgroundColor = Color(0xffF6F6F6);
  static var selectedNavBarColor = const Color.fromARGB(255, 146, 132, 227);
  static const unselectedNavBarColor = Colors.black;

  // Category images
  static List<HashMap<String, String>> categoryImages = [
    HashMap<String, String>.from({
      'title': 'Mobiles',
      'image': 'assets/images/category_images/mobiles.jpeg'
    }),
    HashMap<String, String>.from({
      'title': 'Fashion',
      'image': 'assets/images/category_images/fashion.jpeg'
    }),
    HashMap<String, String>.from({
      'title': 'Electronics',
      'image': 'assets/images/category_images/electronics.jpeg'
    }),
    HashMap<String, String>.from(
        {'title': 'Home', 'image': 'assets/images/category_images/home.jpeg'}),
    HashMap<String, String>.from({
      'title': 'Beauty',
      'image': 'assets/images/category_images/beauty.jpeg'
    }),
    HashMap<String, String>.from({
      'title': 'Appliances',
      'image': 'assets/images/category_images/appliances.jpeg'
    }),
    HashMap<String, String>.from({
      'title': 'Grocery',
      'image': 'assets/images/category_images/grocery.jpeg'
    }),
    HashMap<String, String>.from({
      'title': 'Books',
      'image': 'assets/images/category_images/books.jpeg'
    }),
    HashMap<String, String>.from({
      'title': 'Essentials',
      'image': 'assets/images/category_images/essentials.jpeg'
    }),
  ];

  // Carousel images
  static List<HashMap<String, String>> carouselImages = [
    HashMap<String, String>.from({
      'category': 'Mobiles',
      'image':
          'https://www.megabites.com.ph/wp-content/uploads/2023/11/POCO11.11_MainKV-copy.jpg',
    }),
    HashMap<String, String>.from({
      'category': 'Beauty',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699265354/carousel_images/ysdubrrkwbi5rqqcupg5.jpg',
    }),
    HashMap<String, String>.from({
      'category': 'Appliances',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699265359/carousel_images/lh9urah5mtrd8uolos2m.jpg',
    }),
    HashMap<String, String>.from({
      'category': 'Book',
      'image':
          'https://res.cloudinary.com/dnkkh5vuz/image/upload/c_fill,g_auto,h_700,w_1080/v1703920654/mxfohqiqzsqjmidccqzd.png',
    }),
    HashMap<String, String>.from({
      'category': 'Fashion',
      'image':
          'https://res.cloudinary.com/dnkkh5vuz/image/upload/c_fill,g_auto,h_700,w_1080/v1703920654/mxfohqiqzsqjmidccqzd.png',
    }),
    HashMap<String, String>.from({
      'category': 'Mobiles',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699265355/carousel_images/josedcgjkzst3iqnpqgf.jpg',
    }),
    HashMap<String, String>.from({
      'category': 'Beauty',
      'image':
          'https://res.cloudinary.com/dnkkh5vuz/image/upload/c_fill,g_auto,h_700,w_1080/v1703920654/mxfohqiqzsqjmidccqzd.png',
    }),
    HashMap<String, String>.from({
      'category': 'Grocery',
      'image':
          'https://res.cloudinary.com/dnkkh5vuz/image/upload/c_fill,g_auto,h_700,w_1080/v1703920654/mxfohqiqzsqjmidccqzd.png',
    }),
    HashMap<String, String>.from({
      'category': 'Home',
      'image':
          'https://res.cloudinary.com/dnkkh5vuz/image/upload/c_fill,g_auto,h_700,w_1080/v1703920654/mxfohqiqzsqjmidccqzd.png',
    }),
  ];

  //Bottom offer under price
  static List<HashMap<String, String>> bottomOffersUnderPrice = [
    HashMap<String, String>.from({
      'title': 'Budget Buys',
      'image': 'assets/images/bottom_offers/budgetBuys.png'
    }),
    HashMap<String, String>.from({
      'title': 'Best Buys',
      'image': 'assets/images/bottom_offers/bestBuys.png'
    }),
    HashMap<String, String>.from({
      'title': 'Super Buys',
      'image': 'assets/images/bottom_offers/superBuys.png'
    }),
    HashMap<String, String>.from({
      'title': 'Top Picks',
      'image': 'assets/images/bottom_offers/topPicks.png'
    }),
  ];

  // Bottom offers images
  static List<HashMap<String, String>> bottomOfferImages = [
    HashMap<String, String>.from({
      'category': 'Mobiles',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699264799/bottom_offers/uthsphrtzpcfubvq9dwn.png',
    }),
    HashMap<String, String>.from({
      'category': 'Mobiles',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699264798/bottom_offers/qctd1ju8kieb9oyuyfc2.jpg',
    }),
    HashMap<String, String>.from({
      'category': 'Essentials',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdLGvcZcv4RxxAHTtDJZ8VX1At0dYIcFjJxJfudfOl1yF9qmSiN6eZxn4gLG6b_bGW_O4&usqp=CAU',
    }),
    HashMap<String, String>.from({
      'category': 'Grocery',
      'image':
          'https://d3jmn01ri1fzgl.cloudfront.net/photoadking/webp_thumbnail/62a2de66f0727_json_image_1654840934.webp',
    }),
  ];

  // Multiimage offers
  // mulit image offer 1
  static List<HashMap<String, String>> multiImageOffer1 = [
    HashMap<String, String>.from({
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616716/multi_image_offers/multi_image_offer1/ixunkzn9ihxmq7sz5kbu.jpg',
      'offerTitle': 'Health & household'
    }),
    HashMap<String, String>.from({
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616716/multi_image_offers/multi_image_offer1/qoluocxlfvfsm06aft7m.jpg',
      'offerTitle': 'Grocery essentials'
    }),
    HashMap<String, String>.from({
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616716/multi_image_offers/multi_image_offer1/opop30gr9ko1rh31elnp.jpg',
      'offerTitle': 'Beauty products'
    }),
    HashMap<String, String>.from({
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616716/multi_image_offers/multi_image_offer1/drlfqq5spc08gtpwoehi.jpg',
      'offerTitle': 'Visit store'
    }),
  ];

  // Multi image offers 2
  static List<HashMap<String, String>> multiImageOffer2 = [
    HashMap<String, String>.from({
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616730/multi_image_offers/multi_image_offer2/fy7cga8bnkhbwdczeojg.jpg',
      'offerTitle': 'Under Php 299 | Kitchen accessories'
    }),
    HashMap<String, String>.from({
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616730/multi_image_offers/multi_image_offer2/vpvy0tubzfu5xb7rdowo.jpg',
      'offerTitle': 'Under Php 499 | Kitchen jars, containers & more'
    }),
    HashMap<String, String>.from({
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616730/multi_image_offers/multi_image_offer2/ozc0y0aprcduz1k6mzbn.jpg',
      'offerTitle': 'Php 499 - Php 999 | Cookware sets'
    }),
    HashMap<String, String>.from({
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616730/multi_image_offers/multi_image_offer2/f9zsqeaq2shwflttwfcu.jpg',
      'offerTitle': 'Min. 60% Off | Dinnerware'
    }),
  ];

  // multi image offer 3
  static List<HashMap<String, String>> multiImageOffer3 = [
    HashMap<String, String>.from({
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616731/multi_image_offers/multi_image_offer3/cxywqfuwdqdlmxfwhznh.jpg',
      'offerTitle': 'Redmi (32) 4K TV | Lowest ever prices'
    }),
    HashMap<String, String>.from({
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616731/multi_image_offers/multi_image_offer3/jypnmwrxog1zhmgkn0mq.jpg',
      'offerTitle': 'OnePlus (50) 4K TV | Flat 43% off'
    }),
    HashMap<String, String>.from({
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616731/multi_image_offers/multi_image_offer3/by0atjdadl3vdxvkwcxe.jpg',
      'offerTitle': 'Samsung (65) iSmart TV | Bestseller'
    }),
    HashMap<String, String>.from({
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616732/multi_image_offers/multi_image_offer3/kdbran924rp1dcfxkc37.jpg',
      'offerTitle': 'Sony (55) 4K TV | Get 3 years warranty'
    }),
  ];

  static List<HashMap<String, String>> multiImageOffer5 = [
    HashMap<String, String>.from({
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616735/multi_image_offers/multi_image_offer5/jmowr6zekxwqa1eb9byb.png',
      'offerTitle': 'Cooking ingredients'
    }),
    HashMap<String, String>.from({
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616736/multi_image_offers/multi_image_offer5/jl5sruf184umnwrhic3s.png',
      'offerTitle': 'Sweets'
    }),
    HashMap<String, String>.from({
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616737/multi_image_offers/multi_image_offer5/jqdwbsu2f9zbribwyybs.png',
      'offerTitle': 'Cleaning supplies'
    }),
    HashMap<String, String>.from({
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616740/multi_image_offers/multi_image_offer5/frqjrpvryuwsmga2ohay.png',
      'offerTitle': 'View all offers'
    }),
  ];

  static List<HashMap<String, String>> productQualityDetails = [
    HashMap<String, String>.from({
      'iconName': 'replacement.png',
      'title': '7 days Service Centre Replacement'
    }),
    HashMap<String, String>.from(
        {'iconName': 'free_delivery.png', 'title': 'Free Delivery'}),
    HashMap<String, String>.from(
        {'iconName': 'warranty.png', 'title': '1 Year Warranty'}),
    HashMap<String, String>.from(
        {'iconName': 'pay_on_delivery.png', 'title': 'Pay on Delivery'}),
    HashMap<String, String>.from(
        {'iconName': 'top_brand.png', 'title': 'Top Brand'}),
    HashMap<String, String>.from(
        {'iconName': 'delivered.png', 'title': 'ShopEase Delivery'}),
  ];

  static List<HashMap<String, String>> menuScreenImages = [
    HashMap<String, String>.from({
      'title': 'Mobiles, Smartphones',
      'category': 'Mobiles',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699008683/menu_screen_images/hpaduzg6ws3gttr1fvqc.png',
    }),
    HashMap<String, String>.from({
      'title': 'Fashion, Clothing',
      'category': 'Fashion',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699008683/menu_screen_images/kf3f4gsxfrc05iewamt3.png'
    }),
    HashMap<String, String>.from({
      'title': 'Electronics & Audio',
      'category': 'Electronics',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699008678/menu_screen_images/kurapdxq9i2n2m6vvdyz.png'
    }),
    HashMap<String, String>.from({
      'title': 'Home, Kitchen & Decor',
      'category': 'Home',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699008675/menu_screen_images/jyp9jwyudc0jh6gao2uc.png'
    }),
    HashMap<String, String>.from({
      'title': 'Beauty, Skincare',
      'category': 'Beauty',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699008678/menu_screen_images/b5zl9qkm3cx20eklrfjm.png'
    }),
    HashMap<String, String>.from({
      'title': 'Appliances',
      'category': 'Appliances',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699008672/menu_screen_images/i8u2o2lknnqhjaybewbr.png'
    }),
    HashMap<String, String>.from({
      'title': 'Grocery, Food & Beverages',
      'category': 'Grocery',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699008681/menu_screen_images/wlad5ab74zzn49iqhkbk.png'
    }),
    HashMap<String, String>.from({
      'title': 'Books, Novels',
      'category': 'Books',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699008671/menu_screen_images/javbsvmojbp3725oysoo.jpg'
    }),
    HashMap<String, String>.from({
      'title': 'Essentials, Kitchen',
      'category': 'Essentials',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699008683/menu_screen_images/u7lk7kkv4vlra4dhjdnj.png'
    }),
  ];
}
