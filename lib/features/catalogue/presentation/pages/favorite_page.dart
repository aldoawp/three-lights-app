import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tlb_app/core/common/widgets/loader.dart';
import 'package:tlb_app/features/catalogue/domain/entities/catalogue_entity.dart';
import 'package:tlb_app/features/catalogue/presentation/bloc/catalogue_bloc.dart';
import 'package:tlb_app/features/catalogue/presentation/widgets/catalogue_card.dart';
import 'package:tlb_app/my_app.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<CatalogueList> savedItems = [];
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorit',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
        toolbarHeight: 80,
        flexibleSpace: Container(
          color: ColorResource.primary,
        ),
      ),
      body: BlocBuilder<CatalogueBloc, CatalogueState>(
        builder: (context, state) {
          if (state is CatalogueLoading) {
            return Loader();
          }
          if (state is CatalogueLoaded) {
            savedItems = state.catalogue.catalogues
                .where((item) => item.is_bookmarked)
                .toList();
            return Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: CatalogueCard(
                  catalogue: state.catalogue,
                  items: savedItems,
                  scrollController: _scrollController,
                  height: height),
            );
          }
          return Center(
            child: Text('Oops, kamu belum memiliki model rambut favorit'),
          );
        },
      ),
    );
  }
}
