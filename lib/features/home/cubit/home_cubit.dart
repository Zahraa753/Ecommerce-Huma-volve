import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_huma_volve/features/home/cubit/home_state.dart';
import 'package:ecommerce_app_huma_volve/features/home/service/home_service.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  HomeService homeService = HomeService();

  Future loadCategories() async {
    try {
      emit(CategoriesLoading());
      final response = await homeService.getCategories();
      emit(CategoriesSuccess(response));
    } catch (e) {
      emit(CategoriesFail(e.toString()));
    }
  }

  Future loadProducts(int? categoryId) async {
    try {
      emit(ProductsLoading());
      final response = await homeService.getProducts(categoryId);
      emit(ProductsSuccess(response));
    } catch (e) {
      emit(ProductsFail(e.toString()));
    }
  }
}
