import 'dart:convert';

import 'package:myserver/models/balance.dart';
import 'package:myserver/models/conversion_model.dart';
import 'package:myserver/models/total_balance.dart';
import 'package:myserver/services/keitaro_service.dart';
import 'package:supabase/supabase.dart';

abstract class API {
  static SupabaseClient? _db;

  static init() async =>
      _db = SupabaseClient(
          'https://njialfdydgxtlilqdnmn.supabase.co',
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5qaWFsZmR5ZGd4dGxpbHFkbm1uIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODk2MTA1NzksImV4cCI6MjAwNTE4NjU3OX0.IfDqjYAhVqxVCXnP0qABnJ8xSf7WsGQqlM36_FPhOew');

  // static Future<List<dynamic>> index() async {
  //   List<Map<String, dynamic>> items = [];
  //   dynamic result = await _db?.query('select id, name from items');
  //   for (final row in result) {
  //     items.add(row['items']);
  //   }
  //   return items;
  // }

  static Future<dynamic> getConversion(ConversionModel conversiondata) async {
    final data = await _db
        ?.from('conversions')
        .select()
        .eq('auid', conversiondata.auid)
        .eq('package', conversiondata.package)
        .order('id', ascending: true);
    return data;
  }

  static Future<dynamic> addConversion(ConversionModel data) async {
    List<dynamic> row = await getConversion(data);
    bool isExist = row.isNotEmpty ? true : false;
    if (!isExist) {
      var res = await _db?.from('conversions').insert(data.toJson()).select();
      return res;
    } else {
      return row.first;
    }
  }

  static Future<dynamic> updateBalance(BalanceModel data) async {
    List<dynamic> checkConv = await _db
        ?.from("balances")
        .select()
        .eq('advertisingId', data.advertisingId)
        .eq('package', data.package)
        .order('id', ascending: true);
    if (checkConv.isEmpty) {
      var res = await _db?.from('balances').insert(data.toJson()).select();
    }
    return checkConv;
  }

  static Future<dynamic> getBalance({required String userId}) async {
    final response =
    await _db?.rpc('calculate_user_balance', params: {'user_id': userId});

    print("response $response");
    return TotalBalance.fromJson(response);
  }

  static Future<BalanceModel> newDeposit(BalanceModel data) async {
    print(data.toJson());
    var res = await _db?.from('balances').insert(data.toJson()).select();
    List<dynamic> balances = res.map((data) {
      print(data);
      return BalanceModel.fromJson(data);
    }).toList();
    print(res);
    return balances.first;
  }

  static Future<dynamic> confirmTransaction({required int id}) async {
    final res = await _db
        ?.from('balances')
        .update({'status': 1}).match({'id': id}).select();

    return res;
  }

  static Future<dynamic> getKeitaroCampaign({required String userId}) async {
    List<dynamic> res = await _db
        ?.from("users")
        .select()
        .eq('userId', userId)
        .order('id', ascending: true);

    if (res.isEmpty) {
      var keitaroCampaignID = await DioClient().createCampaign(userId: userId);
      print("keitaroCampaignID $keitaroCampaignID");
      await setKeitaroCampaign(userId: userId, campaignId: keitaroCampaignID);

      var keitaroCampaign =
      await DioClient().getCampaign(id: "$keitaroCampaignID");

      return keitaroCampaign;
    } else {
      print("EXIST ${res}");
      var keitaroCampaign =
      await DioClient().getCampaign(id: "${res.first["keitaroCampaign"]}");
      return keitaroCampaign;
    }
  }

  static Future<dynamic> setKeitaroCampaign(
      {required String userId, required int campaignId}) async {
    await _db
        ?.from("users")
        .insert({"userId": userId, "keitaroCampaign": campaignId});
  }

  static Future<dynamic> updateAccs({required List<String> accs,
    required String userId,
    required String appPackage}) async {
    List<dynamic> res = await _db?.from("user_apps").select()
        .eq("user", userId).eq("app", appPackage);
    List<String> fbAccs = accs;
    if(res.first["fbAccs"] !=null) {
      fbAccs = [...res.first["fbAccs"],...accs];
    }
    return await _db
        ?.from("user_apps")
        .update({"fbAccs": fbAccs})
        .eq("user", userId)
        .eq("app", appPackage)
        .select();
  }
}
