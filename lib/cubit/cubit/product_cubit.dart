import 'package:api/models/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  static ProductCubit get(context) => BlocProvider.of(context);

  List<ProductModel> products =[]; 

  List<ProductModel> searchProducts = [];


  Dio dio = Dio();


  void search(String text) {
    searchProducts = products
        .where((element) =>
            element.title!.toLowerCase().contains(text.toLowerCase()))
        .toList();

    emit(SearchProductsState());
  }


 void getProducts() {
    emit(GetProductLoading());
    dio.get("https://fakestoreapi.com/products").then((value) {
      if (value.statusCode == 200) {
        for (var element in value.data) {
          products.add(ProductModel.fromJson(element));
        }

        emit(GetProductSuccess());
      }
    }).catchError((error) {
      print(error.toString());
      emit(GetProductError());
    });
  }
  

  }




