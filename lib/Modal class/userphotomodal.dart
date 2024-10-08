class userphoto {
  String? userId;
  String? photo;

  userphoto({this.userId, this.photo});

  userphoto.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['photo'] = this.photo;
    return data;
  }
}
