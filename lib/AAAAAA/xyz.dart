import 'package:flutter/material.dart';
//in xml data formatting becomes quite heavy while in json it is quite light weight.
// in json - javascript object notation 
// ot convert a language array to json we use a jsonencodefunction
// whatsapp desktop is made by elctron js
// api base url- for ex we have made a api and put it on my website then all the api will have a comman url
// end point- suppose there is a 
//2 types of api-  request and response api
//in request- we have get and post method , in get method is used when we are getting data from the api.
//in get method we can send small data and only palin text data 
//in get method data is visible with http 
//in post method there is tight security
//in post method we send data as-
//{"name":"ABc","Mobile":"88998899"}
// pro gaurd rule- to encrypt the code
//postman ,jsonplceholder
class pictures {
  int? _albumId;
  int? _id;
  String? _title;
  String? _url;
  String? _thumbnailUrl;

  picture(
      {int? albumId,
      int? id,
      String? title,
      String? url,
      String? thumbnailUrl}) {
    if (albumId != null) {
      this._albumId = albumId;
    }
    if (id != null) {
      this._id = id;
    }
    if (title != null) {
      this._title = title;
    }
    if (url != null) {
      this._url = url;
    }
    if (thumbnailUrl != null) {
      this._thumbnailUrl = thumbnailUrl;
    }
  }

  int? get albumId => _albumId;
  set albumId(int? albumId) => _albumId = albumId;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get url => _url;
  set url(String? url) => _url = url;
  String? get thumbnailUrl => _thumbnailUrl;
  set thumbnailUrl(String? thumbnailUrl) => _thumbnailUrl = thumbnailUrl;

  pictures.fromJson(Map<String, dynamic> json) {
    _albumId = json['albumId'];
    _id = json['id'];
    _title = json['title'];
    _url = json['url'];
    _thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this._albumId;
    data['id'] = this._id;
    data['title'] = this._title;
    data['url'] = this._url;
    data['thumbnailUrl'] = this._thumbnailUrl;
    return data;
  }
}