import 'package:bloc/bloc.dart';
import 'package:flutter_fic7_sugiyono/data/datasources/category_remote_datasource.dart';
import 'package:flutter_fic7_sugiyono/data/models/categories_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_bloc.freezed.dart';
part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(const _Initial()) {
    on<CategoriesEvent>((event, emit) async {
      emit(const _Loading());
      final result = await CategoryRemoteDatasource().getCategories();
      result.fold((l) => emit(_Error(l)), (r) => emit(_$_Loaded(r)));
    });
  }
}
