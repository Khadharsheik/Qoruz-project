// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_place_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketListResponse _$MarketListResponseFromJson(Map<String, dynamic> json) =>
    MarketListResponse(
      idHash: json['id_hash'] as String?,
      userDetails: json['user_details'] == null
          ? null
          : UserDetails.fromJson(json['user_details'] as Map<String, dynamic>),
      isHighValue: json['is_high_value'] as bool?,
      createdAt: json['created_at'] as String?,
      description: json['description'] as String?,
      requestDetails: json['request_details'] == null
          ? null
          : RequestDetails.fromJson(
              json['request_details'] as Map<String, dynamic>),
      status: json['status'] as String?,
      serviceType: json['service_type'] as String?,
      targetAudience: json['target_audience'] as String?,
      isOpen: json['is_open'] as bool?,
      isPanIndia: json['is_pan_india'] as bool?,
      anyLanguage: json['any_language'] as bool?,
      isDealClosed: json['is_deal_closed'] as bool?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$MarketListResponseToJson(MarketListResponse instance) =>
    <String, dynamic>{
      'id_hash': instance.idHash,
      'user_details': instance.userDetails?.toJson(),
      'is_high_value': instance.isHighValue,
      'created_at': instance.createdAt,
      'description': instance.description,
      'request_details': instance.requestDetails?.toJson(),
      'status': instance.status,
      'service_type': instance.serviceType,
      'target_audience': instance.targetAudience,
      'is_open': instance.isOpen,
      'is_pan_india': instance.isPanIndia,
      'any_language': instance.anyLanguage,
      'is_deal_closed': instance.isDealClosed,
      'slug': instance.slug,
    };

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
      name: json['name'] as String?,
      profileImage: json['profile_image'] as String?,
      company: json['company'] as String?,
      designation: json['designation'] as String?,
    );

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profile_image': instance.profileImage,
      'company': instance.company,
      'designation': instance.designation,
    };

RequestDetails _$RequestDetailsFromJson(Map<String, dynamic> json) =>
    RequestDetails(
      cities:
          (json['cities'] as List<dynamic>?)?.map((e) => e as String).toList(),
      followersRange: json['followers_range'] == null
          ? null
          : FollowersRange.fromJson(
              json['followers_range'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      platform: (json['platform'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      budget: json['budget'] as String?,
      brand: json['brand'] as String?,
      creatorCountMin: (json['creator_count_min'] as num?)?.toInt(),
      creatorCountMax: (json['creator_count_max'] as num?)?.toInt(),
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$RequestDetailsToJson(RequestDetails instance) =>
    <String, dynamic>{
      'cities': instance.cities,
      'followers_range': instance.followersRange?.toJson(),
      'categories': instance.categories,
      'languages': instance.languages,
      'platform': instance.platform,
      'budget': instance.budget,
      'brand': instance.brand,
      'creator_count_min': instance.creatorCountMin,
      'creator_count_max': instance.creatorCountMax,
      'gender': instance.gender,
    };

FollowersRange _$FollowersRangeFromJson(Map<String, dynamic> json) =>
    FollowersRange(
      igFollowersMin: json['ig_followers_min'] as String?,
      igFollowersMax: json['ig_followers_max'] as String?,
      ytSubscribersMin: json['yt_subscribers_min'] as String?,
      ytSubscribersMax: json['yt_subscribers_max'] as String?,
    );

Map<String, dynamic> _$FollowersRangeToJson(FollowersRange instance) =>
    <String, dynamic>{
      'ig_followers_min': instance.igFollowersMin,
      'ig_followers_max': instance.igFollowersMax,
      'yt_subscribers_min': instance.ytSubscribersMin,
      'yt_subscribers_max': instance.ytSubscribersMax,
    };
