import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:superops/app/data/model/message_list_model.dart';

Future<MessageListModel?> messageListAPI({String? pageToken}) async {
  var client = http.Client();

  try {
    String url = '';
    if (pageToken == null) {
      url = 'https://message-list.appspot.com/messages';
    } else {
      url = 'https://message-list.appspot.com/messages?pageToken=$pageToken';
    }

    final response = await client.get(Uri.parse(url));

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final decodeRes = messageListModelFromJson(response.body);
      return decodeRes;
    }
  } on PlatformException catch (e) {
    print(' platform exception ~ $e');
  } on http.ClientException catch (e) {
    print(' platform exception ~ $e');
  } catch (e) {
    print('  platform exception ~ $e');
  } finally {
    client.close();
  }
  return null;
}
