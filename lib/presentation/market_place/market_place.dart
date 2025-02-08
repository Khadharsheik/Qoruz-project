import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoruz_app/core/app_theme.dart';
import 'package:qoruz_app/core/routes.dart';
import 'package:qoruz_app/data/domine/market_place/market_bloc.dart';
import 'package:qoruz_app/data/domine/market_place/market_event.dart';
import 'package:qoruz_app/data/domine/market_place/market_state.dart';
import 'package:qoruz_app/data/model/responses/market_place_list_response.dart';
import 'package:qoruz_app/presentation/market_place/market_place_components.dart';

class MarketPlaceScreenState extends StatefulWidget {
  const MarketPlaceScreenState({super.key});

  @override
  State<MarketPlaceScreenState> createState() => _MarketPlaceScreenStateState();
}

List<Widget> chipData = [
  ChipTextElement(
    lable: 'For You',
  ),
  ChipTextElement(
    lable: 'Recent',
  ),
  ChipTextElement(
    lable: 'My Requests',
  ),
  ChipTextElement(
    lable: 'Top Deals',
    icon: Icon(Icons.star_border),
  ),
  ChipTextElement(
    lable: 'Favorite',
  ),
];

List<HighlightTagsListModel> highlightTagList = [
  HighlightTagsListModel(
    tags: 'Bangalore, Tamilnadu, Kerala',
    icon: AppAssets.location,
  ),
  HighlightTagsListModel(
    tags: '10k - 100k',
    icon: AppAssets.instagram,
  ),
  HighlightTagsListModel(
    tags: 'Lifestyle, Fashion',
    icon: AppAssets.category,
  ),
];

class _MarketPlaceScreenStateState extends State<MarketPlaceScreenState> {
  late MarketBloc marketBloc;
  List<MarketListResponse>? marketListResponse = [];
  List<MarketListResponse>? filteredMarketList = [];
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool isLoadingMore = false;
  int page = 1;
  bool hasMore = true;
  bool isChipSelected = false;
  int? selectedIndex;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _searchController.addListener(_filterList);
    marketBloc = MarketBloc()..add(FetchMarketListEvent(pageNumber: 1));
  }

  void _filterList() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredMarketList = marketListResponse
          ?.where((market) => market.serviceType!.toLowerCase().contains(query))
          .toList();
    });
  }

  Future<void> _fetchMarketListForPagination() async {
    if (isLoadingMore || !hasMore) return;

    setState(() {
      isLoadingMore = true;
    });
    try {
      marketBloc.add(FetchMarketListEvent(pageNumber: page));
    } catch (e) {
      log("Error fetching data: $e");
    } finally {
      setState(() {
        isLoadingMore = false;
      });
    }
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _fetchMarketListForPagination();
    }
  }

  bool areListsEqual(
      List<MarketListResponse>? list1, List<MarketListResponse>? list2) {
    if (list1 == null || list2 == null) return false;
    if (list1.length != list2.length) return false;

    for (int i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            snackBar(context, 'You clicked post request!!!');
          },
          backgroundColor: Color(0xFFFE4545),
          icon: Icon(Icons.add, color: Colors.white),
          label: Text(
            'Post Request',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        backgroundColor: AppColors.white,
        body: BlocListener(
          bloc: marketBloc,
          listener: (BuildContext context, state) {
            if (state is MarketListResponseState) {
              if (state.response != null && state.response!.isNotEmpty) {
                setState(() {
                  marketListResponse ??= [];
                  marketListResponse!.addAll(state.response!);
                  filteredMarketList = List.from(marketListResponse!);
                  page++;
                });
              } else if (state.errorMsg != '') {
                if (state.errorMsg == null) {
                  snackBar(context, 'End of the list');
                }

                hasMore = false;
              } else {
                setState(() {
                  hasMore = false;
                });
              }
              setState(() {
                isLoadingMore = false;
              });
            }
          },
          child: Padding(
            padding: EdgeInsets.only(top: 15, right: 15, left: 15),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: AppColors.cardBorderColor,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.boxShadowColor,
                          blurRadius: 20,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 8.0),
                          child: Image.asset(
                            AppAssets.textFieldPicture,
                            width: 32,
                            height: 32,
                            alignment: Alignment.center,
                          ),
                        ),
                        suffixIcon: Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10.0, bottom: 8.0),
                            child: IconButton(
                              onPressed: () {
                                _searchController.clear();
                              },
                              icon: Icon(
                                Icons.close,
                                size: 20,
                              ),
                            )),
                        border: InputBorder.none,
                        hintText: "Type your requirement here . . .",
                        hintStyle: AppTextStyles.chipStyle.copyWith(
                          color: AppColors.cardDetailTextGreyColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: 5,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: chipData.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: CustomChips(
                          widget: chipData[index],
                          isSelected: selectedIndex == index,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Expanded(
                    child: ListView.separated(
                      controller: _scrollController,
                      physics: AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          filteredMarketList!.length + (isLoadingMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == filteredMarketList?.length) {
                          return Center(
                              child: CircularProgressIndicator(
                            backgroundColor: AppColors.primaryColor,
                          ));
                        }

                        final market = filteredMarketList![index];
                        final requestDetails =
                            market.requestDetails ?? RequestDetails();
                        return GestureDetector(
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            Navigator.pushNamed(
                                context, AppRoutes.marketPlaceDetailScreenState,
                                arguments: {
                                  'hashId': marketListResponse![index].idHash
                                });
                          },
                          child: DetailCard(
                            name: market.userDetails!.name,
                            designation:
                                market.userDetails!.designation ?? 'Company',
                            createdAt: market.createdAt,
                            serviceType: market.serviceType,
                            brand: requestDetails.brand ?? '',
                            budget: requestDetails.budget ?? '',
                            location: requestDetails.cities != null &&
                                    requestDetails.cities != []
                                ? requestDetails.cities
                                    .toString()
                                    .replaceAll('[', '')
                                    .replaceAll(']', '')
                                : '',
                            type: market.serviceType,
                            language: requestDetails.languages != null &&
                                    requestDetails.languages != []
                                ? requestDetails.languages
                                    .toString()
                                    .replaceAll('[', '')
                                    .replaceAll(']', '')
                                : '',
                            profileImageUrl:
                                market.userDetails!.profileImage ?? '',
                            description: market.description,
                            highlightTagList: highlightTagList,
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 16,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
