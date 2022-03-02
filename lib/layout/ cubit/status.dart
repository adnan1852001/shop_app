
abstract class ShopStatus{}
class shopLoginInitialStates extends ShopStatus{}

class shopLoginLoadingState extends ShopStatus{}

class shopLoginSuccessState extends ShopStatus{}

class shopLoginErrorState extends ShopStatus{
  final String error;

  shopLoginErrorState(this.error);
}



