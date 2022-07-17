import 'package:favorite_pizza/src/core/common_widgets/app_button.dart';
import 'package:favorite_pizza/src/core/constants/app_dimen.dart';
import 'package:favorite_pizza/src/core/theme/app_border_decoration_theme.dart';
import 'package:favorite_pizza/src/model/pizza/pizza_model.dart';
import 'package:flutter/material.dart';

import '../../../core/common_widgets/app_image_widget.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_text_theme.dart';

class PizzaItemWidget extends StatelessWidget {
  final PizzaModel pizzaModelData;
  const PizzaItemWidget({Key? key, required this.pizzaModelData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
     borderOnForeground: true,
      child: Column(
        children: [
          AppImageWidget(imageUrl: pizzaModelData.image ?? " "),
          ListTile(
            title: Align(
              alignment: Alignment.center,
              child: Text(
                pizzaModelData.restaurant ?? " ",
                style: AppTextTheme.heading2Style,
              ),
            ),
            subtitle: Align(
              alignment: Alignment.center,
              child: Text(
                pizzaModelData.address ?? "",
                style: AppTextTheme.inputTextStyle,
              ),
            ),
          ),
          Visibility(
            visible: pizzaModelData.restaurant != null &&
                (pizzaModelData.restaurant?.isNotEmpty ?? false),
            replacement: const Text(AppStrings.pizzaErrorViewMessage),
            child: SizedBox(
              height: 250,
              child: ListView.separated(
                separatorBuilder: (_,pos){
                  return const SizedBox(
                    width: AppDimen.boxDecorationSizeWidth,
                  );
              },
                itemCount: pizzaModelData.pizzaSelections!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, pos) {
                  PizzaSelections pizzaData =
                      pizzaModelData.pizzaSelections![pos];
                  return Container(
                    width: MediaQuery.of(context).size.width*.4,
                      decoration:AppBorderDecorationTheme.appBorderDecoration(),
                      child: Column(
                      children: [
                        AppImageWidget(imageUrl: pizzaData.image ?? ""),
                        Align(
                          alignment: Alignment.bottomCenter,
                            child: Text("${pizzaData.name}",
                              style: AppTextTheme.inputTextStyle,)),
                         IconButton(
                             onPressed: (){

                             },
                             icon:Icon(Icons.shopping_cart)
                         )
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
