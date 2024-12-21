import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tlb_app/core/error/exceptions.dart';
import 'package:tlb_app/features/catalogue/data/models/catalogue_model.dart';

abstract interface class CatalogueDataSources {
  Future<CatalogueModel> getCatalogues(String uid);
  Future<CatalogueModel> toggleBookmark(
      CatalogueModel catalogue, String uid, int cid, bool isBook);
}

class CatalogueDataSourceImpl implements CatalogueDataSources {
  final SupabaseClient supabaseClient;

  CatalogueDataSourceImpl(this.supabaseClient);

  @override
  Future<CatalogueModel> getCatalogues(String uid) async {
    try {
      final response = await supabaseClient
          .rpc('fetch_catalogues', params: {'user_id': uid});
      // print(response);
      final catalogueModel = CatalogueModel.fromJson(response);
      // print('...catalogue: $catalogueModel...');
      return catalogueModel;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<CatalogueModel> toggleBookmark(
      CatalogueModel catalogue, String uid, int cid, bool isBook) async {
    dynamic response;
    try {
      if (isBook) {
        response = await supabaseClient
            .from('saved_styles')
            .delete()
            .match({'user_id': uid, 'catalogue_id': cid});
      } else {
        response = await supabaseClient.from('saved_styles').insert({
          'user_id': uid,
          'catalogue_id': cid,
          'created_at': DateTime.now().toIso8601String(),
          'updated_at': DateTime.now().toIso8601String(),
        });
      }

      final updatedCatalogues = catalogue.catalogues
          .map(
            (e) {
              if (e is CatalogueListModel && e.catalogueId == cid) {
                return e.copyWith(is_bookmarked: !isBook);
              }
              return e;
            },
          )
          .toList()
          .cast<CatalogueListModel>();

      final updatedCatalogueModel =
          catalogue.copyWith(catalogues: updatedCatalogues);
      return updatedCatalogueModel;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
