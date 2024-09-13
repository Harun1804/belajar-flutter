import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../model/blog.dart';

class Repository {
  final baseUrl = 'http://192.168.88.252:8080/api';

  //get data with metode async
  Future<Map<String, dynamic>> fetchBlogs(int page) async {
    final response = await http.get(Uri.parse('$baseUrl/blog?page=$page'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Blog> posts = (data['data']['data'] as List)
          .map((postJson) => Blog.fromJson(postJson))
          .toList();
      return {
        'posts': posts,
        'nextPageUrl': data['data']['next_page_url'],
      };
    } else {
      throw Exception('Failed to load data');
    }
  }

  //insert posts
  Future<bool> insertBlog(File? image, String title, String body) async {
    final request = http.MultipartRequest('POST', Uri.parse('$baseUrl/posts'));
    request.fields['title'] = title;
    request.fields['body'] = body;
    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        image!.path,
      ),
    );
    final response = await request.send();
    if (response.statusCode == 201) {
      return true;
    } else {
      throw false;
    }
  }

  //update post
  Future<bool> updateBlog(
      File? image, String title, String body, int id) async {
    final request =
    http.MultipartRequest('POST', Uri.parse('$baseUrl/posts/$id'));
    request.fields['title'] = title;
    request.fields['body'] = body;
    request.fields['_method'] = 'PUT';
    if (image != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          image.path,
        ),
      );
    }

    final response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      throw false;
    }
  }

  // delete post
  Future<bool> deleteBlog(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/posts/$id'));
    if (response.statusCode == 200) {
      return true;
    } else {
      throw false;
    }
  }
}