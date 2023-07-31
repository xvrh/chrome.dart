// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'communication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerInfo _$ServerInfoFromJson(Map<String, dynamic> json) => ServerInfo(
      puppeteerUrl: json['puppeteerUrl'] as String,
      platform: json['platform'] as String,
    );

Map<String, dynamic> _$ServerInfoToJson(ServerInfo instance) =>
    <String, dynamic>{
      'puppeteerUrl': instance.puppeteerUrl,
      'platform': instance.platform,
    };

LogRequest _$LogRequestFromJson(Map<String, dynamic> json) => LogRequest(
      log: json['log'] as String,
    );

Map<String, dynamic> _$LogRequestToJson(LogRequest instance) =>
    <String, dynamic>{
      'log': instance.log,
    };

TerminateRequest _$TerminateRequestFromJson(Map<String, dynamic> json) =>
    TerminateRequest(
      success: json['success'] as bool,
    );

Map<String, dynamic> _$TerminateRequestToJson(TerminateRequest instance) =>
    <String, dynamic>{
      'success': instance.success,
    };
