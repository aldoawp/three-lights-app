import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tlb_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:tlb_app/core/common/widgets/loader.dart';
import 'package:tlb_app/core/utils/scroll_position.dart';
import 'package:tlb_app/features/catalogue/domain/entities/catalogue_entity.dart';
import 'package:tlb_app/features/catalogue/presentation/bloc/catalogue_bloc.dart';
import 'package:tlb_app/features/catalogue/presentation/widgets/catalogue_card.dart';
import 'package:tlb_app/features/catalogue/presentation/widgets/custom_card_widget.dart';
import 'package:tlb_app/features/catalogue/presentation/widgets/search_bar_widget.dart';
import 'package:tlb_app/features/catalogue/presentation/widgets/style/catalogue_text_style.dart';
import 'package:tlb_app/injection_container.dart';
import 'package:tlb_app/my_app.dart';

class CataloguePage extends StatefulWidget {
  const CataloguePage({super.key});

  @override
  State<CataloguePage> createState() => _CataloguePageState();
}

class _CataloguePageState extends State<CataloguePage> {
  late String userId;

  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  List<CatalogueList> items = [];
  List<CatalogueList> filteredItems = [];

  @override
  void initState() {
    super.initState();
    userId = (context.read<AppUserCubit>().state as AppUserLoggedIn).user.uid;
    print(userId);
    context.read<CatalogueBloc>().add(GetCataloguesEvent(userId));
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
    _textFocusNode.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final catalogue = context.read<CatalogueBloc>().state as CatalogueLoaded;
    // print(catalogue);
    // final testitems = catalogue.catalogue.catalogues;

    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: SearchBarWidget(
          textController: _textController,
          textFocusNode: _textFocusNode,
          onTextChanged: (value) {
            setState(() {
              filteredItems = items
                  .where(
                    (element) => element.styleName
                        .toLowerCase()
                        .contains(value.toLowerCase()),
                  )
                  .toList();
            });
          },
        ),
        toolbarHeight: 80,
        flexibleSpace: Container(
          color: ColorResource.primary,
        ),
        actions: [
          IconButton(
            onPressed: () => context.pushNamed(Routes.askAiPage.name),
            icon: Icon(Icons.message_rounded, color: Colors.white),
            iconSize: 30,
          ),
          IconButton(
            onPressed: () => context.pushNamed(Routes.savedCataloguePage.name),
            icon: Icon(Icons.bookmark_rounded, color: Colors.white),
            iconSize: 30,
          ),
        ],
      ),
      body: SafeArea(
        child: BlocConsumer<CatalogueBloc, CatalogueState>(
          listener: (context, state) {
            debugPrint(state.toString());
            if (state is CatalogueLoaded) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (_scrollController.hasClients) {
                  _scrollController
                      .jumpTo(sl<ScrollPositionUtils>().currentScrollPosition);
                }
              });
            }
          },
          builder: (context, state) {
            if (state is CatalogueLoading) {
              return Loader();
            }
            if (state is CatalogueLoaded) {
              items = state.catalogue.catalogues;
              filteredItems = _textController.text.isEmpty
                  ? items
                  : items
                      .where((item) => item.styleName
                          .toLowerCase()
                          .contains(_textController.text.toLowerCase()))
                      .toList();

              return Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "MEN HAIRSTYLE",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                        color: Colors.black38,
                      ),
                    ),
                    _textController.text.isEmpty
                        ? CatalogueDescriptionWidget(items: items)
                        : SizedBox.shrink(),
                    // CatalogueDescriptionWidget(items: items),
                    SizedBox(height: 18),
                    Expanded(
                        child: CatalogueCard(
                            catalogue: state.catalogue,
                            items: filteredItems,
                            scrollController: _scrollController,
                            height: height)),
                  ],
                ),
              );
            }
            return Center(
              child: Text('No Data'),
            );
          },
        ),
      ),
    );
  }
}

class CatalogueDescriptionWidget extends StatelessWidget {
  const CatalogueDescriptionWidget({
    super.key,
    required this.items,
  });

  final List<CatalogueList> items;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Tersedia ',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: items.length.toString(),
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              color: Colors.black,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(
            text: ' Model Rambut',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
