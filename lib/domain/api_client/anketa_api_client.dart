import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:samduapp/config/configuration.dart';
import 'package:http/http.dart' as http;
import 'package:samduapp/domain/api_client/network_client.dart';
import 'package:samduapp/domain/entity/user.dart';

class AnketaApiClient {
  final HttpClient _httpClient = HttpClient();
  Future<File?> pickImage() async {
    if (Platform.isWindows) {
      try {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['jpg', 'jpeg', 'png'],
        );

        if (result != null) {
          // Handle selected file
          String filePath = result.files.single.path!;
          // print('Selected file: $filePath');

          final file = File(filePath);

          return file;
        } else {
          // User canceled the picker
          // print('User canceled the picker');
          return null;
        }
      } catch (e) {
        // print('Error picking file: $e');
      }
    } else {
      try {
        final ImagePicker picker = ImagePicker();
        XFile? image = await picker.pickImage(source: ImageSource.gallery);

        if (image != null) {
          // print('Selected image path: ${image.path}');

          final file = File(image.path);
          // Handle selected image

          return file;
        } else {
          // User canceled the image picker
          // print('User canceled the image picker');
        }
      } catch (e) {
        // print('Error picking image: $e');
      }
    }
    return null;
  }

  Future<void> uploadAvatarImage(
    int userId,
    String token,
    File file,
  ) async {
    try {
      final url = Uri.parse('$saveAvatarImage/$userId');
      await _httpClient.postUrl(url);
      var multipartFile = await http.MultipartFile.fromPath('file', file.path);
      var multipartRequest = http.MultipartRequest('POST', url)
        ..headers['Authorization'] = 'Bearer $token'
        ..headers['Accept'] = 'application/json'
        ..files.add(multipartFile);

      var streamedResponse = await multipartRequest.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        // print('File uploaded successfully');
      } else {
        print('Failed to upload file. Status code: ${response.statusCode}');
      }

      // final request = http.MultipartRequest('POST', url);
      // request.headers['Authorization'] = 'Bearer $token';
      // request.headers['Content-Type'] = 'application/json';
      // final multipartFile =
      //     await http.MultipartFile.fromPath('file', file.path);
      // request.files.add(multipartFile);

      // final streamedResponse = await request.send();
      // final response = await http.Response.fromStream(streamedResponse);

      // print(response.statusCode);
    } catch (e) {
      // print(e);
    }
  }

  Future<User?> userInfo(userId, token) async {
    // final NetworkClient _networkClient = NetworkClient();
    // parser(dynamic json) {
    //   final response = json['user']['image'];
    //   return response;
    // }

    // final result = await _networkClient.get(
    //   token,
    //   '$userURL/$userId',
    //   parser,
    // );

    // if (result != null) {
    //   return result;
    // }
    // return null;

    final url = Uri.parse('$baseURL/user/$userId');
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    try {
      // Make the GET request
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        // Parse the response body
        Map<String, dynamic> data = json.decode(response.body);
        final userInfo = User.fromJson(data);

        // Access user information from the data
        // For example, assuming the user information is stored in a 'user' key
        // Map<String, dynamic> userInfo = data['user'];

        // Print or use the user information as needed
        // print('User Information: $userInfo');
        // final imagePath = userInfo['image'];
        // return imagePath;
        return userInfo;
      } else {
        // Handle error cases
        // print('Error: ${response.statusCode} - ${response.reasonPhrase}');
        return null;
      }
    } catch (error) {
      // print('Error: $error');
      return null;
    }
  }
}
