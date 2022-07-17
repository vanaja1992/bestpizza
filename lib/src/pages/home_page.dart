import 'package:favorite_pizza/src/core/constants/app_colors.dart';
import 'package:favorite_pizza/src/core/constants/app_strings.dart';
import 'package:favorite_pizza/src/features/cart/widgets/cart_widget.dart';
import 'package:favorite_pizza/src/features/orders/widgets/order_widget.dart';
import 'package:favorite_pizza/src/features/profile/widgets/profile_widget.dart';
import 'package:favorite_pizza/src/features/pizzas/widgets/pizza_list_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const fragments = [PizzaListWidget(), OrderWidget(), CartWidget(), ProfileWidget()];
  int index = 0;
  static const title = [AppStrings.home, AppStrings.orders,AppStrings.cart, AppStrings.profile];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title[index]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: AppColors.bottomNavLabel,
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: AppStrings.home,
              backgroundColor: AppColors.menuColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: AppStrings.orders,
              backgroundColor: AppColors.menuColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: AppStrings.cart,
              backgroundColor: AppColors.menuColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: AppStrings.profile,
              backgroundColor: AppColors.menuColor),
        ],
      ),
      body: SafeArea(child: fragments[index]),
    );
  }
}
