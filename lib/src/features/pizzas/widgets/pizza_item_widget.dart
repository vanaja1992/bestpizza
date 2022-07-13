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
      child: Column(
        children: [
          AppImageWidget(imageUrl: pizzaModelData.image ?? " "),
          ListTile(
            title: Text(
              pizzaModelData.restaurant ?? " ",
              style: AppTextTheme.heading2Style,
            ),
            subtitle: Text(
              pizzaModelData.address ?? "",
              style: AppTextTheme.inputTextStyle,
            ),
          ),
          Visibility(
            visible: pizzaModelData.restaurant != null &&
                (pizzaModelData.restaurant?.isNotEmpty ?? false),
            replacement: const Text(AppStrings.pizzaErrorViewMessage),
            child: ListView.builder(
              itemCount: pizzaModelData.pizzaSelections!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, pos) {
                PizzaSelections pizzaData =
                    pizzaModelData.pizzaSelections![pos];
                return SizedBox(
                  height: 24,
                  width: 24,
                  child: Card(
                    child: Stack(
                      children: [
                        AppImageWidget(imageUrl: pizzaData.image ?? ""),
                        Positioned(
                            left: 24,
                            bottom: 24,
                            child: Text("${pizzaData.name}"))
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
