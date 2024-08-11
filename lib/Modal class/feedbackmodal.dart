class feedmodal {
  String? likes;
  String? comment;
  String? rating;
  String? pId;
  String? uId;

  feedmodal({this.likes, this.comment, this.rating, this.pId, this.uId});

  feedmodal.fromJson(Map<String, dynamic> json) {
    likes = json['Likes'];
    comment = json['Comment'];
    rating = json['Rating'];
    pId = json['p_id'];
    uId = json['u_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Likes'] = this.likes;
    data['Comment'] = this.comment;
    data['Rating'] = this.rating;
    data['p_id'] = this.pId;
    data['u_id'] = this.uId;
    return data;
  }
}