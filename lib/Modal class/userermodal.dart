class userser {
  String? id;

  String? name;
  String? email;
  String? number;
  String? password;

  userser({this.id,this.name, this.email, this.number, this.password});

  userser.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    name = json['name'];
    email = json['email'];
    number = json['number'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
   //data['id']=this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['number'] = this.number;
    data['password'] = this.password;
    return data;
  }
}
