
import 'package:favorite_pizza/src/core/constants/app_strings.dart';
import 'package:favorite_pizza/src/features/pizzas/cubit/pizza_cubit.dart';
import 'package:favorite_pizza/src/features/pizzas/cubit/pizza_repository.dart';
import 'package:favorite_pizza/src/features/pizzas/widgets/pizza_item_widget.dart';
import 'package:favorite_pizza/src/model/pizza/pizza_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PizzaListWidget extends StatelessWidget {
  const PizzaListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PizzaCubit(PizzaRepository())..loadPizza(),
      child: BlocBuilder<PizzaCubit, PizzaState>(
        builder: (context, state) {
          if (state is PizzaInitial || state is PizzaLoading) {
            return const CircularProgressIndicator();
          } else if (state is PizzaLoadedError) {
            return const Text(AppStrings.pizzaErrorMessage);
          } else if (state is PizzaLoadedSuccess) {
            List<PizzaModel> pizzaData = state.pizzaModel;
            return ListView.builder(
                itemCount: pizzaData.length,
                itemBuilder: (context, pos) {
                  PizzaModel pizzaModelData = pizzaData[pos];
                  // return ListData();
                  return PizzaItemWidget(pizzaModelData: pizzaModelData);
                });
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
