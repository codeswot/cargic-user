import 'dart:convert';
import 'package:cargic_user/providers/app_data.dart';
import 'package:cargic_user/utils/global_variables.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SendRequestHelper {
  static sendNottification({String token, context, String reqID}) async {
    var data = Provider.of<AppData>(context, listen: false);

    Map<String, String> headerMap = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverToken',
    };
    Map<String, String> nottificationMap = {
      'title': 'NEW CARGIC SERVICE',
      'body': 'From:${data.userName} ${data.serviceType},${data.vName}',
    };
    Map<String, dynamic> dataMap = {
      'id': '1',
      'click_action': 'FLUTTER_NOTIFICATION_CLICK',
      'status': 'done',
      'req_id': reqID,
    };
    Map<String, dynamic> bodyMap = {
      'nottification': nottificationMap,
      'data': dataMap,
      'priority': 'high',
      'to': token,
    };
    var response = await http.post(
      'https://fcm.googleapis.com/fcm/send',
      headers: headerMap,
      body: jsonEncode(bodyMap),
    );
    print(response.body);
  }
}
