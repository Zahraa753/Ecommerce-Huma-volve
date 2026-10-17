import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/use_cases/get_category_use_case.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/use_cases/get_product_use_case.dart';
import 'package:ecommerce_app_huma_volve/features/home/presentation/view_model/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  GetProductUseCase getProductUseCase;
  GetCategoryUseCase getCategoryUseCase;

  HomeCubit(this.getCategoryUseCase, this.getProductUseCase)
    : super(CategoriesLoading());
  Future loadCategories() async {
    emit(CategoriesLoading());

    final categories = await getCategoryUseCase.invoke();
    categories.fold(
      (falure) => emit(CategoriesFail(falure.failureMessage)),
      (categories) => emit(CategoriesSuccess(categories))
    );
    
  }

  Future loadProducts(int? categoryId) async {
      emit(ProductsLoading());
      final products = await getProductUseCase.invoke(categoryId);
      products.fold(
      (falure) => emit(ProductsFail(falure.failureMessage)),
      (products) => emit(ProductsSuccess(products))
    );
    
  }
}
