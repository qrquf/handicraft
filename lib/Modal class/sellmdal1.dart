class sellmodal1 {
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
  String? name;
  String? product1;
  String? product2;
  String? product3;
  String? product4;
  String? discount;
  String? price;
  String? sale;
  String? category;
  String? sId;

  sellmodal1(
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
      this.countryCode,
      this.name,
      this.product1,
      this.product2,
      this.product3,
      this.product4,
      this.discount,
      this.price,
      this.sale,
      this.category,
      this.sId});

  sellmodal1.fromJson(Map<String, dynamic> json) {
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
    name = json['name'];
    product1 = json['product1'];
    product2 = json['product2'];
    product3 = json['product3'];
    product4 = json['product4'];
    discount = json['discount'];
    price = json['price'];
    sale = json['sale'];
    category = json['category'];
    sId = json['s_id'];
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
    data['name'] = this.name;
    data['product1'] = this.product1;
    data['product2'] = this.product2;
    data['product3'] = this.product3;
    data['product4'] = this.product4;
    data['discount'] = this.discount;
    data['price'] = this.price;
    data['sale'] = this.sale;
    data['category'] = this.category;
    data['s_id'] = this.sId;
    return data;
  }
}