import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:myserver/constants.dart';
import 'package:myserver/models/balance.dart';
import 'package:myserver/models/conversion_model.dart';
import 'package:myserver/models/new_track.dart';
import 'package:myserver/models/total_balance.dart';
import 'package:myserver/services/ZCPAPIDioClient.dart';
import 'package:supabase/supabase.dart';

abstract class ZCPAPI {
  static SupabaseClient? _db;

  static Future<NewTrack?> newTrack({
    required double amount,
    required String token,
    required int orderId,
  }) async {
    String sign = newSign(amount: amount, token: token, orderId: orderId);
    NewTrack newTrack = await ZCPDioClient()
        .newTrack(amount: amount, token: token, orderId: orderId, sign: sign);

    return newTrack;
  }

  static String newSign(
      {required double amount, required String token, required int orderId}) {
    var dataToHash =
        '${amount}${Constants.zrcpaySecret}$orderId${Constants.myLogin}';

    var bytesToHash = utf8.encode(dataToHash);
    var sha256Digest = sha256.convert(bytesToHash);

    print('Data to hash: $dataToHash');
    print('SHA-256: ${sha256Digest}');
    return sha256Digest.toString();
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
    return TotalBalance.fromJson(response);
  }

  static Future<dynamic> newDeposit(BalanceModel data) async {
    print(data.toJson());
    var res = await _db?.from('balances').insert(data.toJson()).select();
    List<dynamic> balances = res.map((data) {
      print(data);
      return BalanceModel.fromJson(data);
    }).toList();
    print(res);
    return balances.first.id;
  }
}
