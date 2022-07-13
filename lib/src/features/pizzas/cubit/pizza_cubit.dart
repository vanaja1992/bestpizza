import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:favorite_pizza/src/core/constants/app_strings.dart';
import 'package:favorite_pizza/src/features/pizzas/cubit/pizza_repository.dart';
import 'package:favorite_pizza/src/model/pizza/pizza_model.dart';

part 'pizza_state.dart';

class PizzaCubit extends Cubit<PizzaState> {
  final PizzaRepository pizzaRepository;
  PizzaCubit(this.pizzaRepository) : super(PizzaInitial());

  loadPizza() async {
 emit(PizzaLoading());
 try{
   List<PizzaModel> pizzaModelList = await PizzaRepository().fetchRestaurants();
   emit(PizzaLoadedSuccess(pizzaModelList));
 }
 catch(ex){
   emit(const PizzaLoadedError(AppStrings.pizzaErrorMessage));
 }


  }

}
