// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'] as String,
      nickname: json['nickname'] as String,
      // name: json['name'] as String,
      email: json['email'] as String,
      imageUrl: json['imageUrl'] as String?,
      // goalList: (json['goalList'] as List<dynamic>?)
      //     ?.map((e) => GoalModel.fromJson(e as Map<String, dynamic>))
      //     .toList(),
      friendUidList: (json['friendUidList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      friendTrackList: (json['friendTrackList'] as List<dynamic>?)
          ?.map((e) => TrackModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'nickname': instance.nickname,
      // 'name': instance.name,
      'email': instance.email,
      'imageUrl': instance.imageUrl,
      'goalList': instance.goalList,
      'friendUidList': instance.friendUidList,
      'friendTrackList': instance.friendTrackList,
    };
