import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoruz_app/core/app_theme.dart';
import 'package:qoruz_app/core/services.dart';
import 'package:qoruz_app/data/domine/market_place/market_bloc.dart';
import 'package:qoruz_app/data/domine/market_place/market_event.dart';
import 'package:qoruz_app/data/domine/market_place/market_state.dart';
import 'package:qoruz_app/data/model/responses/market_place_list_response.dart';
import 'package:qoruz_app/presentation/market_place/market_place_components.dart';

class MarketPlaceDetailScreenState extends StatefulWidget {
  final String hashId;
  const MarketPlaceDetailScreenState({super.key, required this.hashId});

  @override
  State<MarketPlaceDetailScreenState> createState() =>
      MarketPlaceDetailScreenStateState();
}

class MarketPlaceDetailScreenStateState
    extends State<MarketPlaceDetailScreenState> {
  late MarketBloc marketBloc;
  MarketListResponse? marketListResponse;
  @override
  void initState() {
    super.initState();
    marketBloc = MarketBloc()
      ..add(FetchMarketProfileDetailEvent(hashId: widget.hashId));
  }

  List<HighlightTagsListModel> detailPageHighlightTagList = [
    HighlightTagsListModel(
      tags: 'Bangalore, Tamilnadu, Kerala',
      icon: AppAssets.location,
    ),
    HighlightTagsListModel(
      tags: '10k - 100k',
      icon: AppAssets.instagram,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 120,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(AppAssets.clock),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Your post has will be expired on 26 July",
                    style: AppTextStyles.marketListProfileDesignationStyle
                        .copyWith(
                      color: AppColors.cardDetailTextBlackColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      snackBar(context, 'You clicked cancel!!');
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Color(0xFFFE4545),
                      side: BorderSide(color: Color(0xFFFE4545)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    child: Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      snackBar(context, 'You clicked confirm!!');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFE4545),
                      foregroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    child: Text("Confirm"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          height: 100,
          padding: EdgeInsets.only(left: 12, right: 12, bottom: 15),
          decoration: BoxDecoration(
            color: AppColors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(AppAssets.leftArrowIcon)),
              Spacer(),
              GestureDetector(
                  onTap: () {
                    snackBar(context, 'You clicked delete!!');
                  },
                  child: Image.asset(
                    AppAssets.trashIcon,
                    height: 25,
                    width: 25,
                  )),
              SizedBox(
                width: 16,
              ),
              GestureDetector(
                  onTap: () {
                    ServiceUtils.shareText();
                  },
                  child: Image.asset(AppAssets.shareIcon)),
            ],
          ),
        ),
      ),
      body: BlocListener(
        bloc: marketBloc,
        listener: (BuildContext context, state) {
          if (state is MarketProfileDetailResponseState) {
            if (state.response != null) {
              setState(() {
                marketListResponse = state.response;
              });
            }
          }
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (marketListResponse != null)
                ProfileDetail(
                  name: marketListResponse!.userDetails!.name,
                  designation: marketListResponse!.userDetails!.designation,
                  profileImageUrl:
                      marketListResponse!.userDetails!.profileImage,
                  company: marketListResponse!.userDetails!.company,
                  createdAt: marketListResponse!.createdAt,
                ),
              Padding(
                padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Looking for',
                      style: AppTextStyles.marketListProfileDesignationStyle,
                      textAlign: TextAlign.start,
                    ),
                    if (marketListResponse != null)
                      Text(
                        marketListResponse!.serviceType!,
                        style: AppTextStyles.marketListProfileDesignationStyle
                            .copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.cardDetailTextBlackColor,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(
                      color: AppColors.dividerGreyColor,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Highlights',
                      style: AppTextStyles.marketListProfileDesignationStyle,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    HighlightedTags(
                      highlightTagList: detailPageHighlightTagList,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    if (marketListResponse != null)
                      MarketProfiledetailCard(
                        budget: marketListResponse!.requestDetails != null
                            ? marketListResponse!.requestDetails!.budget
                            : '',
                        brand: marketListResponse!.requestDetails != null
                            ? marketListResponse!.requestDetails!.brand
                            : '',
                        language: marketListResponse!.requestDetails != null &&
                                marketListResponse!.requestDetails!.languages !=
                                    null &&
                                marketListResponse!.requestDetails!.languages !=
                                    []
                            ? marketListResponse!.requestDetails!.languages
                                .toString()
                                .replaceAll('[', '')
                                .replaceAll(']', '')
                            : '',
                        location: marketListResponse!.requestDetails != null &&
                                marketListResponse!.requestDetails!.cities !=
                                    null &&
                                marketListResponse!.requestDetails!.cities != []
                            ? marketListResponse!.requestDetails!.cities
                                .toString()
                                .replaceAll('[', '')
                                .replaceAll(']', '')
                            : '',
                        type: marketListResponse!.serviceType,
                        description: marketListResponse!.description,
                      ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SocialMediaShare(
                          platformName: 'WhatsApp',
                          logoPath: AppAssets.whatsAppLogo,
                          color: AppColors.whatsAppButtonColor,
                          ontap: () {
                            ServiceUtils.shareOnWhatsApp();
                          },
                        ),
                        SocialMediaShare(
                          platformName: 'LinkedIn',
                          logoPath: AppAssets.linkedInLogo,
                          color: AppColors.linkedInButtonColor,
                          isSocialMedia: true,
                          ontap: () {
                            ServiceUtils.shareOnLinkedIn('Hi Qoruz');
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Hardcoded data for placeholders
                    if (marketListResponse != null &&
                        marketListResponse!.requestDetails != null)
                      HighlightsContainer(
                        heading: "Key Highlighted Details",
                        data: [
                          if (marketListResponse!.requestDetails!.categories !=
                                  null &&
                              marketListResponse!.requestDetails!.categories !=
                                  [])
                            {
                              "topic": "Category",
                              "content": marketListResponse!
                                  .requestDetails!.categories
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', ''),
                            },
                          {
                            "topic": "Platform",
                            "content": marketListResponse!
                                .requestDetails!.platform
                                .toString()
                                .replaceAll('[', '')
                                .replaceAll(']', ''),
                          },
                          if (marketListResponse!.requestDetails!.languages !=
                                  null &&
                              marketListResponse!.requestDetails!.languages !=
                                  [])
                            {
                              "topic": "Language",
                              "content": marketListResponse!
                                  .requestDetails!.languages
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', ''),
                            },
                          if (marketListResponse!.requestDetails!.cities !=
                                  null &&
                              marketListResponse!.requestDetails!.cities != [])
                            {
                              "topic": "Location",
                              "content": marketListResponse!
                                  .requestDetails!.cities
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', ''),
                            },
                          {"topic": "Required count", "content": "15 - 20"},
                          if (marketListResponse!.requestDetails!.budget !=
                              null)
                            {
                              "topic": "Our Budget",
                              "content":
                                  marketListResponse!.requestDetails!.budget!,
                            },
                          {"topic": "Brand collab with", "content": "Swiggy"},
                          {
                            "topic": "Required followers",
                            "content": "500k -1M+"
                          },
                        ],
                      ),

                    SizedBox(
                      height: 200,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileDetail extends StatelessWidget {
  final String? profileImageUrl;
  final String? createdAt;
  final String? company;
  final String? name;
  final String? designation;

  const ProfileDetail({
    super.key,
    this.profileImageUrl,
    this.createdAt,
    this.company,
    this.name,
    this.designation,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      color: AppColors.cardHighlighsGreyColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
              Row(
                children: [
                  Text(
                    name != null && name != '' ? truncateText(name!) : 'Name',
                    style: AppTextStyles.marketListProfileNameStyle,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Image.asset(AppAssets.linkedInLogo),
                  SizedBox(
                    width: 5,
                  ),
                  Image.asset(AppAssets.verified),
                ],
              ),
              Text(
                designation != null
                    ? truncateText(designation!)
                    : 'Designation',
                style: AppTextStyles.marketListProfileDesignationStyle,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Icon(
                    Icons.business_outlined,
                    size: 14,
                    color: AppColors.subHeadingColor,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    company != null ? truncateText(company!) : 'Company',
                    style: AppTextStyles.marketListProfileDesignationStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Text(
            createdAt != null ? truncateText(createdAt!) : '',
            style: AppTextStyles.marketDetailCreatedAtStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
