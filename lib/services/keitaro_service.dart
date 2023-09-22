import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:myserver/models/keitaro_campaign.dart';

class DioClient {
  final Dio _dio = Dio(BaseOptions(
    headers: {
      "Api-Key": "b54c723226a9a800375a2ba661968313",
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  ));

  final _baseUrl = 'https://config.fastern.site/admin_api/v1';

  Future<dynamic> getCampaign({required String id}) async {
    Response capmaignData = await _dio.get('$_baseUrl/campaigns/$id/streams');

    print('User Info: ${capmaignData.data}');

    // KeitaroCampaign user = KeitaroCampaign.fromJson(capmaignData.data);

    return capmaignData.data;
  }

  Future<int> createCampaign({required String userId}) async {
    Response capmaignData = await _dio.post('$_baseUrl/campaigns',
        data: jsonEncode({
          "alias": userId,
          "name": userId,
          "type": "position",
          "uniqueness_method": "ip_ua",
          "uniqueness_use_cookies": true,
          "cookies_ttl": 24,
          "position": 9999,
          "state": "active",
          "cost_type": "CPC",
          "cost_value": "0.0000",
          "cost_currency": "USD",
          "group_id": 3,
          "bind_visitors": "",
          "postbacks": [],
          "notes": "",
          "traffic_source_id": 91,
          "cost_auto": true,
          "domain_id": 304,
          "parameters": {
            "keyword": {"name": "keyword", "placeholder": "", "alias": ""},
            "cost": {"name": "cost", "placeholder": "", "alias": ""},
            "currency": {"name": "currency", "placeholder": "", "alias": ""},
            "external_id": {
              "name": "external_id",
              "placeholder": "",
              "alias": ""
            },
            "creative_id": {
              "name": "creative_id",
              "placeholder": "",
              "alias": ""
            },
            "ad_campaign_id": {
              "name": "ad_campaign_id",
              "placeholder": "",
              "alias": ""
            },
            "source": {"name": "source", "placeholder": "", "alias": ""},
            "sub_id_1": {
              "name": "sub_id_1",
              "placeholder": "{app_sub_1}",
              "alias": "sub_id_1"
            },
            "sub_id_2": {
              "name": "sub_id_2",
              "placeholder": "{app_sub_2}",
              "alias": "sub_id_2"
            },
            "sub_id_3": {
              "name": "sub_id_3",
              "placeholder": "{app_sub_3}",
              "alias": "sub_id_3"
            },
            "sub_id_4": {
              "name": "sub_id_4",
              "placeholder": "{app_sub_4}",
              "alias": "sub_id_4"
            },
            "sub_id_5": {
              "name": "sub_id_5",
              "placeholder": "{app_sub_5}",
              "alias": "sub_id_5"
            },
            "sub_id_6": {
              "name": "adid",
              "placeholder": "{app_adid}",
              "alias": "adid"
            },
            "sub_id_7": {
              "name": "advertising_id",
              "placeholder": "{app_advertising_id}",
              "alias": "advertising_id"
            },
            "sub_id_8": {
              "name": "partner_stream",
              "placeholder": "{app_partner_stream}",
              "alias": "partner_stream"
            },
            "sub_id_9": {
              "name": "package_name",
              "placeholder": "{app_package_name}",
              "alias": "package_name"
            }
          },
          "traffic_loss": "0.00",
          "domain": "https://config.fastern.site/",
          "group": "[SERVICE] Users",
          "streams_count": "1",
          "ts": "SERVICE_SOURCE"
        }));

    print('User Info: ${capmaignData.data}');

    return capmaignData.data["id"];
  }

  Future<dynamic> createFlow(
      {required String campaignId, required String streamName}) async {
    Response capmaignData = await _dio.post('$_baseUrl/streams', data: {
      "campaign_id": campaignId,
      "name": "$streamName",
      "schema": "redirect",
      "type": "regular",
      "weight": 100,
      "action_type": "http",
      "action_payload":
          "https://config.fastern.site/vasya?sub_id_1={sub_id_1}&sub_id_2={sub_id_2}&sub_id_3={sub_id_3}&sub_id_4={sub_id_4}&sub_id_5={sub_id_5}&adid={adid}&advertising_id={advertising_id}&package_name={package_name}",
      "action_options": null,
      "comments": null,
      "state": "active",
      "filters": [
        {
          // "id": 21918,
          "name": "sub_id_8",
          "mode": "accept",
          "payload": ["$streamName"],
          "oid": 21918
        }
      ],
      "triggers": [],
      "landings": [],
      "offers": [],
      "collect_clicks": true,
      "filter_or": false
    });

    print('User Info: ${capmaignData.data}');

    return capmaignData.data;
  }

  Future<dynamic> updateFlow(
      {required Map<String, dynamic> jsonFlow,
      required String streamId}) async {
    Response capmaignData =
        await _dio.put('$_baseUrl/streams/$streamId', data: jsonFlow);

    print('User Info: ${capmaignData.data}');

    return capmaignData.data;
  }
}
