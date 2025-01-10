import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tlb_app/features/catalogue/domain/entities/catalogue_entity.dart';
import 'package:tlb_app/features/catalogue/domain/usecases/get_catalogue.dart';
import 'package:tlb_app/features/catalogue/domain/usecases/toggle_bookmark.dart';

part 'catalogue_event.dart';
part 'catalogue_state.dart';

class CatalogueBloc extends Bloc<CatalogueEvent, CatalogueState> {
  final GetCatalogue getCatalogue;
  final ToggleBookmark toggleBookmark;
  CatalogueBloc({required this.getCatalogue, required this.toggleBookmark})
      : super(CatalogueInitial()) {
    on<GetCataloguesEvent>(_onGetCatalogues);
    on<ToggleBookmarkEvent>(_onToggleBookmark);
  }

  Future<void> _onGetCatalogues(
      GetCataloguesEvent event, Emitter<CatalogueState> emit) async {
    emit(CatalogueLoading());
    final catalogue =
        await getCatalogue.call(GetCatalogueParams(uid: event.uid));
    catalogue.fold((failure) {
      print("Catalogue Error: ${failure.message}");
      emit(CatalogueError(error: failure.message));
    }, (catalogue) {
      print("Catalogue Loaded: ${catalogue.catalogues.length} items");
      emit(CatalogueLoaded(catalogue: catalogue));
    });
  }

  Future<void> _onToggleBookmark(
      ToggleBookmarkEvent event, Emitter<CatalogueState> emit) async {
    emit(CatalogueLoading());
    final catalogue = await toggleBookmark.call(ToggleBookmarkParams(
        catalogueEntity: event.catalogueEntity,
        uid: event.uid,
        cid: event.cid,
        isBook: event.isBook));

    catalogue.fold((failure) {
      return emit(CatalogueError(error: failure.message));
    }, (catalogue) {
      return emit(CatalogueLoaded(catalogue: catalogue));
    });
  }
}
