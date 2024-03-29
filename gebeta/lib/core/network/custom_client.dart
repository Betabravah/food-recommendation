import 'dart:convert';

import 'package:http/http.dart' as http;

typedef KeyValue = Map<String, dynamic>;
typedef Headers = Map<String, String>;

class CustomClient {
  final http.Client client;

  String? _authToken;

  String? get authToken => _authToken;

  String apiBaseUrl;

  CustomClient(this.client, {required this.apiBaseUrl});

  set authToken(String? value) {
    _authToken = value;
  }

  Future<http.Response> get(String relativeUrl,
      {KeyValue? queryParams, Headers headers = const {}}) async {
    Headers headersWithAuth = {
      ...headers,
      if (_authToken != null) 'Authorization': '$_authToken'
    };

    return client.get(
        Uri.parse('$relativeUrl').replace(queryParameters: queryParams),
        headers: headersWithAuth);
  }

  Future<http.Response> post(String relativeUrl,
      {required KeyValue body, Headers headers = const {}}) async {
    Headers headersWithAuth = {
      ...headers,
      if (_authToken != null) 'Authorization': '$_authToken'
    };
    print(relativeUrl);

    return client.post(Uri.parse('$relativeUrl'),
        body: json.encode(body), headers: headersWithAuth);
  }

  Future<http.Response> put(String relativeUrl,
      {required KeyValue body, Headers headers = const {}}) async {
    Headers headersWithAuth = {
      ...headers,
      if (_authToken != null) 'Authorization': '$_authToken'
    };
    return client.put(Uri.parse('$relativeUrl'),
        body: json.encode(body), headers: headersWithAuth);
  }

  Future<http.Response> delete(String relativeUrl,
      {Headers headers = const {}}) async {
    Headers headersWithAuth = {
      ...headers,
      if (_authToken != null) 'Authorization': '$_authToken'
    };

    return client.delete(Uri.parse('$relativeUrl'), headers: headersWithAuth);
  }

  // Future<http.StreamedResponse> multipartRequest(String relativeUrl,
  //     {required String method,
  //     required KeyValue body,
  //     Headers headers = const {}}) async {
  //   Headers headersWithAuth = {
  //     ...headers,
  //     if (_authToken != null) 'Authorization': 'Bearer $_authToken'
  //   };

  //   final request = http.MultipartRequest(
  //     method,
  //     Uri.parse('$relativeUrl'),
  //   );

  //   request.headers.addAll(headersWithAuth);

  //   _setRequestData(request, body);

  //   final streamedResponse = await request.send();

  //   return streamedResponse;
  // }

  // void _setRequestData(http.MultipartRequest request, KeyValue body) async {
  //   for (final entry in body.entries) {
  //     // handles fields with string values
  //     if (entry.value is String) {
  //       request.fields.addAll({entry.key: entry.value});
  //     }

  //     // handles fields with list values
  //     else if (entry.value is List<String>) {
  //       for (final item in entry.value) {
  //         request.files
  //             .add(http.MultipartFile.fromString(entry.key, item as String));
  //       }
  //     }

  //     // handles files
  //     else if (entry.value is File) {
  //       request.files.add(
  //         await http.MultipartFile.fromPath(
  //           entry.key,
  //           entry.value.path,
  //           contentType: MediaType('image', 'jpeg'),
  //         ),
  //       );
  //     }
  //   }
  // }
}
