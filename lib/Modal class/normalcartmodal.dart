class normalcart {
  String? result;
  String? message;
  String? data;

  normalcart({this.result, this.message, this.data});

  normalcart.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}