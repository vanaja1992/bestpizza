part of 'pizza_cubit.dart';

abstract class PizzaState extends Equatable {
  const PizzaState();
}

class PizzaInitial extends PizzaState {
  @override
  List<Object> get props => [];
}
class PizzaLoading extends PizzaState {
  @override
  List<Object> get props => [];
}
class PizzaLoadedSuccess extends PizzaState {
 final List<PizzaModel> pizzaModel;

  const PizzaLoadedSuccess(this.pizzaModel);

  @override
  List<Object> get props => [pizzaModel];
}
class PizzaLoadedError extends PizzaState {
  final String errorMessage;

   const PizzaLoadedError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
