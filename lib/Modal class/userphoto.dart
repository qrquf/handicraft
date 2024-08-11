class userphoto1 {
  String? userId;
  String? photo;
  String? id;
  String? name;
  String? email;
  String? number;
  String? password;


  userphoto1({this.userId, this.photo,this.id,this.name, this.email, this.number, this.password});

  userphoto1.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    photo = json['photo'];
     id=json['id'];
    name = json['name'];
    email = json['email'];
    number = json['number'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['photo'] = this.photo;
    data['name'] = this.name;
    data['email'] = this.email;
    data['number'] = this.number;
    data['password'] = this.password;
    return data;
  }
}
