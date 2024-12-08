import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tlb_app/features/catalogue/presentation/widgets/catalogue_app_bar.dart';
import 'package:tlb_app/features/catalogue/presentation/widgets/catalogue_model.dart';
import 'package:tlb_app/features/catalogue/presentation/widgets/custom_card_widget.dart';
import 'package:tlb_app/my_app.dart';

class CataloguePage extends StatelessWidget {
  const CataloguePage({super.key});

  @override
  Widget build(BuildContext context) {
    final catalogueData = CatalogueData();
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: CatalogueAppBar(),
        toolbarHeight: 80,
        flexibleSpace: Container(
          color: ColorResource.primary,
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(Routes.askAiPage.name);
            },
            icon: Icon(
              Icons.message_rounded,
              size: 30,
              color: Colors.white,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark_rounded,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
      // bottomNavigationBar: NavBar(
      //   currentIndex: cataloguePageIndex,
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 18),
              Text(
                "MEN HAIRSTYLE",
                style: TextStyle(letterSpacing: 0.5, fontSize: 12),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Tersedia ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                      text: catalogueData.catalogueData.length.toString(),
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                      text: ' Model Rambut',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18),
              Expanded(
                child: ListView.builder(
                  itemCount: catalogueData.catalogueData.length,
                  itemBuilder: (context, index) {
                    final item = catalogueData.catalogueData[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: CustomCardWidget(
                        padding: EdgeInsets.fromLTRB(1, 0, 1, 0),
                        child: ListTile(
                          leading: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors
                                  .white, // Sesuaikan dengan background yang diinginkan
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: Colors.grey, // Warna border
                                width: 1, // Ketebalan border
                              ),
                            ),
                            child: Icon(
                              item.iconData,
                              size: 40, // Sesuaikan ukuran ikon
                              color: Colors.black, // Warna ikon
                            ),
                          ),
                          trailing: Icon(
                            Icons.bookmark_outline_rounded,
                            size: 40,
                          ),
                          title: Text(
                            item.hairModel,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            children: [
                              Icon(
                                Icons.cut_rounded,
                                size: 15,
                              ),
                              SizedBox(width: 10),
                              Text(
                                item.hairLength,
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                          onTap: () {
                            showModalBottomSheet(
                              showDragHandle: true,
                              isScrollControlled: true,
                              context: context,
                              builder: (context) => Container(
                                height: height * 0.65,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
