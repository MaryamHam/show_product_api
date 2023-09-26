part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}


class GetProductLoading extends ProductState{}

class GetProductSuccess extends ProductState{}

class GetProductError extends ProductState{}

class SearchProductsState extends ProductState{}
