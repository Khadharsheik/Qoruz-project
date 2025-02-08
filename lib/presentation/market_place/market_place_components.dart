import 'package:flutter/material.dart';
import 'package:qoruz_app/core/app_theme.dart';

String truncateText(String text, {int maxLength = 35}) {
  return text.length > maxLength ? '${text.substring(0, maxLength)}...' : text;
}

lableAndData(
    {String? label,
    String? data,
    int? dataStringLength,
    bool isDetailPage = false}) {
  return data != null && data != ''
      ? RichText(
          text: TextSpan(
            style: isDetailPage
                ? AppTextStyles.marketDetailTextStyle
                : AppTextStyles.marketListDetailStyle,
            children: [
              TextSpan(
                text: '$label: ',
              ),
              TextSpan(text: data),
            ],
          ),
        )
      : SizedBox.shrink();
}

class HighlightedTags extends StatelessWidget {
  final List<HighlightTagsListModel> highlightTagList;

  const HighlightedTags({
    super.key,
    required this.highlightTagList,
  });
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: highlightTagList.map((tagItem) {
        return Container(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Color(0xFFF5F6FB),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(6)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (tagItem.icon != null) Image.asset(tagItem.icon!),
              if (tagItem.icon != null) SizedBox(width: 4),
              Text(
                tagItem.tags,
                style: AppTextStyles.marketListHighlightTagStyle,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class HighlightTagsListModel {
  final String tags;
  final String? icon;

  HighlightTagsListModel({
    required this.tags,
    this.icon,
  });
}

class DetailCard extends StatelessWidget {
  final String? name;
  final String? designation;
  final String? description;
  final String? profileImageUrl;
  final String? createdAt;
  final String? serviceType;
  final String? budget;
  final String? brand;
  final String? location;
  final String? type;
  final String? language;
  final List<HighlightTagsListModel>? highlightTagList;

  final String? detail;

  const DetailCard(
      {super.key,
      this.name,
      this.designation,
      this.description,
      this.profileImageUrl,
      this.createdAt,
      this.serviceType,
      this.brand,
      this.budget,
      this.language,
      this.location,
      this.type,
      this.highlightTagList,
      this.detail});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: AppColors.cardBorderColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipOval(
                  child: Image.network(
                    height: 56,
                    width: 56,
                    profileImageUrl != null ? profileImageUrl! : '',
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        AppAssets.profileIcon,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name != null && name != '' ? truncateText(name!) : 'Name',
                      style: AppTextStyles.marketListProfileNameStyle,
                    ),
                    Text(
                      designation != null ? truncateText(designation!) : '',
                      style: AppTextStyles.marketListProfileDesignationStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      createdAt != null ? truncateText(createdAt!) : '',
                      style: AppTextStyles.marketListProfileLastSeenStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 14,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(children: [
              Image.asset(AppAssets.people),
              SizedBox(
                width: 3,
              ),
              Text(
                serviceType != null ? truncateText(serviceType!) : '',
                style: AppTextStyles.marketListServiceTypeStyle,
              ),
            ]),
            SizedBox(
              height: 8,
            ),
            Divider(),
            SizedBox(
              height: 8,
            ),
            lableAndData(label: 'Budget', data: budget),
            lableAndData(label: 'Brand', data: brand),
            lableAndData(label: 'Location', data: location),
            lableAndData(label: 'Type', data: type),
            lableAndData(label: 'Language', data: language),
            RichText(
              maxLines: 4,
              text: TextSpan(
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 20 / 14,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationThickness: 1.0,
                  color: AppColors.cardDetailTextBlackColor,
                ),
                children: [
                  TextSpan(
                    text: description != null
                        ? description!.length > 180
                            ? description!.substring(0, 180)
                            : description!
                        : '',
                  ),
                  TextSpan(
                    text: '...show more',
                    style: AppTextStyles.marketListDetailStyle.copyWith(
                      color: AppColors.cardDetailTextGreyColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            highlightTagList != null &&
                    highlightTagList!.isNotEmpty &&
                    budget != null
                ? HighlightedTags(
                    highlightTagList: highlightTagList!,
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class CustomChips extends StatelessWidget {
  final Widget widget;
  final bool isSelected;

  const CustomChips({
    super.key,
    required this.widget,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.seletedChipLightColor : AppColors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: isSelected
                ? AppColors.seletedChipColor
                : AppColors.cardBorderColor,
            width: 1,
          ),
        ),
        child: widget);
  }
}

class ChipTextElement extends StatelessWidget {
  final String lable;
  final Icon? icon;

  const ChipTextElement({
    super.key,
    required this.lable,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return icon != null
        ? Row(
            children: [
              icon!,
              Text(
                lable,
                style: AppTextStyles.chipStyle,
              )
            ],
          )
        : Text(
            lable,
            style: AppTextStyles.chipStyle,
          );
  }
}

class HighlightsContainer extends StatelessWidget {
  final String heading;
  final List<Map<String, String>> data;

  const HighlightsContainer({
    super.key,
    required this.heading,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: AppTextStyles.chipStyle.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textGreyColor,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 100,
            runSpacing: 10,
            children: data.map((item) {
              return Container(
                constraints: const BoxConstraints(minWidth: 100, maxWidth: 100),
                padding: const EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['topic']!,
                      style: AppTextStyles.marketDetailKeyHighlightsTextStyle,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['content']!,
                      style:
                          AppTextStyles.marketListProfileLastSeenStyle.copyWith(
                        color: AppColors.textGreyColor,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class SocialMediaShare extends StatelessWidget {
  final String platformName;
  final String logoPath;
  final Color? color;
  final bool isSocialMedia;
  final Function ontap;
  const SocialMediaShare({
    super.key,
    required this.platformName,
    required this.logoPath,
    this.color = AppColors.white,
    this.isSocialMedia = false,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        width: 170,
        height: 36,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              logoPath,
              width: 25,
              height: 25,
            ),
            const SizedBox(width: 4),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: isSocialMedia ? "share on " : "share via ",
                    style: AppTextStyles.marketDetailCreatedAtStyle.copyWith(
                      color: AppColors.cardDetailTextBlackColor,
                    ),
                  ),
                  TextSpan(
                    text: "Account",
                    style: AppTextStyles.marketDetailCreatedAtStyle.copyWith(
                      color: AppColors.cardDetailTextBlackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MarketProfiledetailCard extends StatelessWidget {
  final String? serviceType;
  final String? budget;
  final String? brand;
  final String? location;
  final String? type;
  final String? language;
  final String? description;

  const MarketProfiledetailCard({
    super.key,
    this.serviceType,
    this.budget,
    this.brand,
    this.location,
    this.type,
    this.language,
    this.description,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        lableAndData(label: 'Budget', data: budget, isDetailPage: true),
        lableAndData(label: 'Brand', data: brand, isDetailPage: true),
        lableAndData(label: 'Location', data: location, isDetailPage: true),
        lableAndData(label: 'Type', data: type, isDetailPage: true),
        lableAndData(label: 'Language', data: language, isDetailPage: true),
        RichText(
          maxLines: 4,
          text: TextSpan(
            style: AppTextStyles.marketDetailTextStyle,
            children: [
              TextSpan(
                text: description != null
                    ? description!.length > 180
                        ? description!.substring(0, 180)
                        : description!
                    : '',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

snackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    action: SnackBarAction(
      label: 'ok',
      onPressed: () {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
