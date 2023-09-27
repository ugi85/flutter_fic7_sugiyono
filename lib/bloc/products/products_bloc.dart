// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasources/product_remote_datasource.dart';
import '../../data/models/products_response_model.dart';

part 'products_bloc.freezed.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(const _Initial()) {
    on<_GetAll>((event, emit) async {
      emit(const _Loading());
      final result = await ProductRemoteDatasource().getProducts();
      result.fold((l) => emit(_Error(l)), (r) => emit(_$_Loaded(r)));
    });
  }
}
