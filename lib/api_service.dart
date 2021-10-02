import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
// import 'package:surabaya_pagi/model/post.dart';
// import 'package:surabaya_pagi/model/album.dart';
SharedPreferences preferences;
//Future<SharedPreferences> preferences = SharedPreferences.getInstance();

class ApiService {
  String apiUrl = "https://jsonplaceholder.typicode.com";
  Client client = Client();

  void savePref(String nama, String token, String email, String jk, String photo) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setBool("isLoggedIn", true);
    preferences.setBool("setNotif", false);
    preferences.setString("nama", nama);
    preferences.setString("email", email);
    preferences.setString("jenis_kelamin", jk);
    preferences.setString("photo", photo);
    preferences.setString("token", token);
    preferences.commit();
  }

  /* Future<String> loginUser(User data) async {
    var response = await client.post(
      "$apiUrl/auth/login",
      headers: {"content-type": "application/json"},
      body: userToJson(data),
    );
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      Mahasiswa dataMhs = Mahasiswa.fromJson(response.body);
      Meta metaData = Mahasiswa.fromJson(response.body).meta;
      savePref(dataMhs.nim, dataMhs.nama, metaData.token, dataMhs.email, dataMhs.jenisKelamin, dataMhs.telp, dataMhs.hp, dataMhs.ttl, dataMhs.dosenWali, dataMhs.agama, dataMhs.photo);
      return "success";
      //return true;
    } else {
      return Message.fromJson(response.body).message;
      //return false;
    }
  } */

  Future<bool> logoutUser() async {
    preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    var response = await client.post(
      Uri.parse("$apiUrl/logout"),
      headers: {"Authorization": "Bearer $token"},
    );
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }


  /* Future<List<Post>> getPosts() async {
    preferences = await SharedPreferences.getInstance();
    // var token = preferences.getString('token');
    var response = await client.get(
      "$apiUrl/posts",
      // headers: {"Authorization": "Bearer $token"},
    );
    // debugPrint(response.body);
    debugPrint("status code : " + response.statusCode.toString());
    if(response.statusCode == 200){
      return postFromJson(response.body);
    }else{
      return null;
    }
  } */

  /* Future<List<Post>> getSearchedPosts(text) async {
    preferences = await SharedPreferences.getInstance();
    // var token = preferences.getString('token');
    var response = await client.get(
      "$apiUrl/posts",
      // headers: {"Authorization": "Bearer $token"},
    );
    // debugPrint(response.body);
    debugPrint("status code : " + response.statusCode.toString());
    if(response.statusCode == 200){
      List<Post> endResult = List<Post>();
      var results = postFromJson(response.body);
      for(int z = 0; z < results.length; z++){
        Post mypost = results[z];
        if(mypost.title.contains(text) || mypost.body.contains(text)){
          endResult.add(results[z]);
        }
      }
      return endResult;
    }else{
      return null;
    }
  } */

  /* Future<List<Album>> getPhotos() async {
    preferences = await SharedPreferences.getInstance();
    // var token = preferences.getString('token');
    var response = await client.get(
      "$apiUrl/photos",
      // headers: {"Authorization": "Bearer $token"},
    );
    debugPrint("status code : " + response.statusCode.toString());
    // debugPrint(response.body);
    if(response.statusCode == 200){
      return albumFromJson(response.body);
    }else{
      return null;
    }
  } */

}