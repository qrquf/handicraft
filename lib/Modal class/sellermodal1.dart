class sellmode {
  String? id;
  String? first;
  String? second;
  String? last;
  String? country;
  String? business;
  String? website;
  String? number;
  String? email;
  String? city;
  String? product;
  String? pincode;
  String? state;
  String? countryCode;

  sellmode(
      {this.id,
      this.first,
      this.second,
      this.last,
      this.country,
      this.business,
      this.website,
      this.number,
      this.email,
      this.city,
      this.product,
      this.pincode,
      this.state,
      this.countryCode});

  sellmode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    first = json['first'];
    second = json['second'];
    last = json['last'];
    country = json['country'];
    business = json['business'];
    website = json['website'];
    number = json['number'];
    email = json['email'];
    city = json['City'];
    product = json['product'];
    pincode = json['pincode'];
    state = json['state'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first'] = this.first;
    data['second'] = this.second;
    data['last'] = this.last;
    data['country'] = this.country;
    data['business'] = this.business;
    data['website'] = this.website;
    data['number'] = this.number;
    data['email'] = this.email;
    data['City'] = this.city;
    data['product'] = this.product;
    data['pincode'] = this.pincode;
    data['state'] = this.state;
    data['country_code'] = this.countryCode;
    return data;
  }
}