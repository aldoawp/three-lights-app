import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlb_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:tlb_app/core/utils/scroll_position.dart';
import 'package:tlb_app/features/catalogue/domain/entities/catalogue_entity.dart';
import 'package:tlb_app/features/catalogue/presentation/bloc/catalogue_bloc.dart';
import 'package:tlb_app/core/common/widgets/custom_card_widget.dart';
import 'package:tlb_app/features/catalogue/presentation/widgets/style/catalogue_text_style.dart';
import 'package:tlb_app/injection_container.dart';
import 'package:tlb_app/core/utils/scroll_position.dart';
import 'package:tlb_app/my_app.dart';

class CatalogueList {
  final String styleName;
  final String hairType;
  final String description;
  final List<CatalogueImage> catalogueImages;
  final bool is_bookmarked;
  String?
      resolvedImageUrl; // Properti baru untuk menyimpan URL gambar yang berhasil

  CatalogueList({
    required this.styleName,
    required this.hairType,
    required this.description,
    required this.catalogueImages,
    required this.is_bookmarked,
    this.resolvedImageUrl, // Optional karena bisa diisi nanti
  });

  // Jika ada factory atau metode parsing, tambahkan 'resolvedImageUrl' di situ
}

class _CatalogueCardState extends State<CatalogueCard> {
  String resolveImageUrl(CatalogueList item, String fileName) {
    // Jika sudah ada resolvedImageUrl, gunakan itu
    if (item.resolvedImageUrl != null) {
      return item.resolvedImageUrl!;
    }

    // Coba primary URL terlebih dahulu
    final primaryUrl = fileName;
    // Jika gagal, gunakan backup URL
    final backupUrl = 'https://hairstyle-catalogue.nos.wjv-1.neo.id/$fileName';

    return primaryUrl;
  }

  void setBackupUrl(CatalogueList item, String fileName) {
    final backupUrl = 'https://hairstyle-catalogue.nos.wjv-1.neo.id/$fileName';
    setState(() {
      item.resolvedImageUrl = backupUrl; // Update URL permanen
    });
  }

  @override
  Widget build(BuildContext context) {
    String userId =
        (context.read<AppUserCubit>().state as AppUserLoggedIn).user.uid;
    return ListView.builder(
      itemCount: widget.items.length,
      controller: widget.scrollController,
      itemBuilder: (context, index) {
        final item = widget.items[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: CustomCardWidget(
            padding: EdgeInsets.zero,
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CachedNetworkImage(
                  imageUrl: item.catalogueImages.isNotEmpty
                      ? resolveImageUrl(item, item.catalogueImages[0].imageUrl)
                      : '', // Gunakan URL fallback jika gagal
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: SizedBox.square(
                      dimension: 40,
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: ColorResource.primary,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) {
                    // Ketika gambar gagal dimuat, gunakan backup URL
                    setBackupUrl(item, item.catalogueImages[0].imageUrl);
                    return Icon(Icons.broken_image_rounded);
                  },
                ),
              ),
              title: Text(
                item.styleName,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.cut_rounded,
                    size: 13.33,
                    color: Colors.black38,
                  ),
                  SizedBox(width: 4),
                  Text(
                    item.hairType.toCapitalized,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.5,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: Icon(
                  item.is_bookmarked
                      ? Icons.bookmark_rounded
                      : Icons.bookmark_border_rounded,
                  color: item.is_bookmarked ? Colors.orange : null,
                ),
                onPressed: () async {
                  sl<ScrollPositionUtils>().saveScrollPosition(
                      widget.scrollController.position.pixels);
                  context.read<CatalogueBloc>().add(
                        ToggleBookmarkEvent(widget.catalogue, userId,
                            item.catalogueId, item.is_bookmarked),
                      );
                },
              ),
              onTap: () {
                FocusScope.of(context).unfocus();

                showModalBottomSheet(
                  showDragHandle: true,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    final hairStyle = item.styleName;
                    final hairType = item.hairType;
                    final hairDesc = item.description;

                    return Container(
                      height: widget.height * 0.65,
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                hairStyle,
                                style: CatalogueTextStyle.title,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '-',
                                style: CatalogueTextStyle.title,
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.cut_rounded,
                                size: 13.33,
                              ),
                              SizedBox(width: 4),
                              Text(
                                hairType.toCapitalized,
                                style: CatalogueTextStyle.title,
                              ),
                            ],
                          ),
                          Text(
                            hairDesc,
                            style: CatalogueTextStyle.subtitle,
                          ),
                          SizedBox(height: 16),
                          Expanded(
                            child: item.catalogueImages.isNotEmpty
                                ? GridView.builder(
                                    itemCount: item.catalogueImages.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      crossAxisSpacing: 8,
                                      mainAxisSpacing: 16,
                                      childAspectRatio: 1.47,
                                    ),
                                    itemBuilder: (context, index) {
                                      final imageUrl = resolveImageUrl(item,
                                          item.catalogueImages[index].imageUrl);
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: CachedNetworkImage(
                                          imageUrl: imageUrl,
                                          fit: BoxFit.cover,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              Center(
                                            child: SizedBox.square(
                                              dimension: 40,
                                              child: CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress,
                                                color: ColorResource.primary,
                                              ),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.broken_image_rounded),
                                        ),
                                      );
                                    },
                                  )
                                : const Center(
                                    child: Text("No Images Available"),
                                  ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
