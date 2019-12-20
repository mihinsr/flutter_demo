import 'dart:convert';
import 'package:fetch_data_demo/model/Data.dart';
import 'package:fetch_data_demo/model/DeleteResponse.dart';
import 'package:fetch_data_demo/model/Employee.dart';
import 'package:fetch_data_demo/model/Post.dart';
import 'package:fetch_data_demo/model/UpdatedData.dart';
import 'package:http/http.dart' as http;

class NetworkUtil {
  static final BASE_URL = "https://api.themoviedb.org/3/";

  static NetworkUtil _instance = new NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> getWithoutHeader(String url) {
    return http.get(url).then((http.Response response) {
      String res = response.body;
      int statusCode = response.statusCode;
      print("API Response: " + res);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        res = "{\"status\":" +
            statusCode.toString() +
            ",\"message\":\"error\",\"response\":" +
            res +
            "}";
        throw new Exception(statusCode);
      }
      return _decoder.convert(res);
    });
  }

// fetch get data object
  Future<Post> fetchPost() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts/1');
    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Employee> PostData(
      String name, String salary, String age, String id) async {
    final response = await http.post(
        'http://dummy.restapiexample.com/api/v1/create',
        body: json.encode({"name": name, "salary": salary, "age": age}));
    print(response.body);
    if (response.statusCode == 200) {
      return Employee.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<DeleteResponse> DeletePost(String id) async {
    final response =
        await http.delete('http://dummy.restapiexample.com/api/v1/delete/$id');
    print(id);
    print(response.body);
    if (response.statusCode == 200) {
      return DeleteResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<UpdatedData> UpdateDatas(
      String name, String salary, String age, String id) async {
    final response = await http.put(
        'http://dummy.restapiexample.com/api/v1/update/$id',
        body: json.encode({"name": name, "salary": salary, "age": age}));
    print(id);
    print(response.body);
    if (response.statusCode == 200) {
      return UpdatedData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  List<Data> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Data>((json) => Data.fromJson(json)).toList();
  }

// fetch get data of array of object
  Future<List<Data>> fetchData(http.Client client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts');

    return parsePhotos(response.body);
  }

/* Future<Data> fetchData() async {
    final response =
    await http.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      return Data.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }*/
/* Future<dynamic> get(String url, {Map<String, String> headers, encoding}) {
    return http
        .get(
      url,
      headers: headers,
    )
        .then((http.Response response) {
      String res = response.body;
      int statusCode = response.statusCode;
      print("API Response: " + res);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        res = "{\"status\":" +
            statusCode.toString() +
            ",\"message\":\"error\",\"response\":" +
            res +
            "}";
        throw new Exception(statusCode);
      }
      return _decoder.convert(res);
    });
  }*/
}
