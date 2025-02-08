import 'package:json_annotation/json_annotation.dart';

part 'market_place_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class MarketListResponse {
  @JsonKey(name: 'id_hash')
  String? idHash;

  @JsonKey(name: 'user_details')
  UserDetails? userDetails;

  @JsonKey(name: 'is_high_value')
  bool? isHighValue;

  @JsonKey(name: 'created_at')
  String? createdAt;

  String? description;

  @JsonKey(name: 'request_details')
  RequestDetails? requestDetails;

  String? status;

  @JsonKey(name: 'service_type')
  String? serviceType;

  @JsonKey(name: 'target_audience')
  String? targetAudience;

  @JsonKey(name: 'is_open')
  bool? isOpen;

  @JsonKey(name: 'is_pan_india')
  bool? isPanIndia;

  @JsonKey(name: 'any_language')
  bool? anyLanguage;

  @JsonKey(name: 'is_deal_closed')
  bool? isDealClosed;

  String? slug;

  MarketListResponse({
    this.idHash,
    this.userDetails,
    this.isHighValue,
    this.createdAt,
    this.description,
    this.requestDetails,
    this.status,
    this.serviceType,
    this.targetAudience,
    this.isOpen,
    this.isPanIndia,
    this.anyLanguage,
    this.isDealClosed,
    this.slug,
  });

  factory MarketListResponse.fromJson(Map<String, dynamic> json) =>
      _$MarketListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MarketListResponseToJson(this);
}

@JsonSerializable()
class UserDetails {
  String? name;

  @JsonKey(name: 'profile_image')
  String? profileImage;

  String? company;
  String? designation;

  UserDetails({
    this.name,
    this.profileImage,
    this.company,
    this.designation,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RequestDetails {
  List<String>? cities;

  @JsonKey(name: 'followers_range')
  FollowersRange? followersRange;

  List<String>? categories;
  List<String>? languages;
  List<String>? platform;
  String? budget;
  String? brand;

  @JsonKey(name: 'creator_count_min')
  int? creatorCountMin;

  @JsonKey(name: 'creator_count_max')
  int? creatorCountMax;

  String? gender;

  RequestDetails({
    this.cities,
    this.followersRange,
    this.categories,
    this.languages,
    this.platform,
    this.budget,
    this.brand,
    this.creatorCountMin,
    this.creatorCountMax,
    this.gender,
  });

  factory RequestDetails.fromJson(Map<String, dynamic> json) =>
      _$RequestDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RequestDetailsToJson(this);
}

@JsonSerializable()
class FollowersRange {
  @JsonKey(name: 'ig_followers_min')
  String? igFollowersMin;

  @JsonKey(name: 'ig_followers_max')
  String? igFollowersMax;

  @JsonKey(name: 'yt_subscribers_min')
  String? ytSubscribersMin;

  @JsonKey(name: 'yt_subscribers_max')
  String? ytSubscribersMax;

  FollowersRange({
    this.igFollowersMin,
    this.igFollowersMax,
    this.ytSubscribersMin,
    this.ytSubscribersMax,
  });

  factory FollowersRange.fromJson(Map<String, dynamic> json) =>
      _$FollowersRangeFromJson(json);

  Map<String, dynamic> toJson() => _$FollowersRangeToJson(this);
}
